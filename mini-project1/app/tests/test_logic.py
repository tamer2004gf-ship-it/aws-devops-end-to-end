import pytest
import sys
import os

# إضافة المسار لضمان أن الاختبار يرى ملف business_logic.py
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from business_logic import TodoManager

class TestTodoManager:
    def setup_method(self):
        """إعادة تهيئة المدير قبل كل اختبار لضمان نظافة البيانات"""
        self.manager = TodoManager()

    def test_create_todo_success(self):
        todo = self.manager.create_todo("Task 1", "Desc 1")
        assert todo["id"] == 1
        assert todo["title"] == "Task 1"
        assert todo["completed"] is False

    def test_create_todo_empty_title_raises_error(self):
        with pytest.raises(ValueError, match="Title cannot be empty"):
            self.manager.create_todo("")

    def test_get_all_todos_empty(self):
        assert self.manager.get_all_todos() == []

    def test_delete_todo_success(self):
        todo = self.manager.create_todo("To be deleted")
        result = self.manager.delete_todo(todo["id"])
        assert result is True
        assert self.manager.get_todo(todo["id"]) is None