  function categoryIssues(id) {
    //******* need to match customer to csr and day
    var category_list = document.getElementById(id);
    var category = category_list.options[category_list.selectedIndex].text;
    if (category != ' ') {
      //* a category was selected so build the appropriate issue list
      var iss = id.replace("category", "issue");
      var issue = document.getElementById(iss);
      issue.options.length = 0;
      var o = document.createElement("option");
      o.selected = true;
      switch (category) {
        case 'OPERATIONS':
          o.text = 'WRONG ITEM'
          issue.options.add(o, issue.options.length);
          o.selected = false;
          o = document.createElement("option");
          o.text = 'SHORT DATE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LOADING ERROR'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LESS THAN ORDERED'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'MORE THAN ORDERED'
          issue.options.add(o, issue.options.length);
          break;
        case 'PURCHASING':
          o.text = 'LATE DELIVERY'
          issue.options.add(o, issue.options.length);
          o.selected = false;
          o = document.createElement("option");
          o.text = 'MORE THAN ORDER'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LESS THAN ORDER'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'HIGH TEMPERATURE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LOW TEMPERATURE'
          issue.options.add(o, issue.options.length);
          break;
        case 'QUALITY':
          o.text = 'INCORRECT CUT'
          issue.options.add(o, issue.options.length);
          o.selected = false;
          o = document.createElement("option");
          o.text = 'PRODUCT APPEARANCE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'BLOOD SHOT'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'BRUISING'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'BROKEN BONES'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'EXPIRED BEFORE DATE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'EXCESS PURGE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'DISCOLORATION'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'FOREIGN MATERIAL - BONE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'FOREIGN MATERIAL - TUMOR'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'FOREIGN MATERIAL - PELLET'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'FOREIGN MATERIAL - OTHER'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'PACKAGING - LOOSE/BLOWN'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'PACKAGING - LEAK'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'PACKAGING - MISLABLED'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'TEXTURE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LOT TO LOT VARIATION'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'COOK UP ISSUE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'MARBLING'
          issue.options.add(o, issue.options.length);
          break;
        default:
          o.text = 'CUSTOMER ORDERED WRONG PRODUCT'
          issue.options.add(o, issue.options.length);
          o.selected = false;
          o = document.createElement("option");
          o.text = 'ORDER ENTRY ERROR'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'CUSTOMER ACCOMODATION'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'PRICING ISSUE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'CREDIT ISSUE'
          issue.options.add(o, issue.options.length);
      }
    }
  }
