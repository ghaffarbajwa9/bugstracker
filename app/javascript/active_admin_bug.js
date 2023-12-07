document.addEventListener('DOMContentLoaded', function() {
    var statusField = document.getElementById('bug_status_input');
    var statusSelect = document.getElementById('status_select');
    var typeSelect = document.getElementById('type_select');
  
    typeSelect.addEventListener('change', function() {
      var selectedType = typeSelect.value;
      if (selectedType === 'Feature') {
        statusField.style.display = 'block';
        statusSelect.innerHTML = '<option value="New">New</option><option value="Started">Started</option><option value="Completed">Completed</option>';
      } else if (selectedType === 'Bug') {
        statusField.style.display = 'block';
        statusSelect.innerHTML = '<option value="New">New</option><option value="Started">Started</option><option value="Resolved">Resolved</option>';
      } else {
        statusField.style.display = 'none';
        statusSelect.innerHTML = '';
      }
    });
  });