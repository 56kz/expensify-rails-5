module ExpensesHelper
  def form_title
    @expense.new_record? ? "Crear Gasto" : "Actualizar Gasto" 
  end
end
