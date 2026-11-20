Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155011;
	b=TqHN8f5mKKN0Wn1v/j9mLmRz0U4BneQOLtgJ02BouC9bRFYeANIboBocfb3PZYywhhey
	 3QmvRbFDFLTdH3aOU3kNSKXHxKe5rdbE+781hnNuTiO76j309x4gFgefgW0dR+oNdRHO8
	 lgSeOlGh/+OEzDdmTWxOPau9N0tZP/Atn7b2oFfOGt1/Ef8gVPndgeojrAtjjCgMfu8CS
	 clLrxANS5NXj5yHYVN15TrZPvv6GytJ2ok051DJDKyIOYl8/UOJXtZWZL9xlWEiyIi+j8
	 T6WijVBinzBwV7q6ClB5K6yCYLBOTlKPjWcxPfAZWJEZ/yH9AhAk1HSKYtIY3VB8vww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155011;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=syOtg6Z3FNvjQ5DBiLQsQ1ZnNEfaeveUo5nGKZyYTfM=;
	b=q9v8y6Tx4WoWlBDgiaWS9B//7CVUCKjfEUKOhtIP1UO+r9YK3RI0LyRa0PtjeCnSrgnE
	 FY8snn4OkEawtuvlSr6blM71Sh3ry+1f1xpRGQUhgqtMfvocD56BBFbhZ87OhNMCHV2To
	 NZ5VR3pXQE65J7biLnFeFXm+/cxF6jdc2mgfOyiPtjVPFK+gl9Fzw1ZG9Kfuealt+fh+K
	 mkgf3+Uruw4tDHfKxIdTvTd8/02VExVFxRJpu3OMSClpaPgJxetU4Ns9dkUlZsL4RqGU7
	 AKkghRXnWu1hjI4BJF0e9spO+5cpyalF0eRjMd2LxDsJDJFGPwXnk/n0JTGOTFtJzFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXUGkTvB;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D971606A524;
	Fri, 20 Nov 2026 06:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D971606A524
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXUGkTvB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795155009; x=1826691009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6MYgJyOBpfQgSdjsR7lSUJEsvsAlWWHimqEm+Q7pJfc=;
  b=hXUGkTvBhpW1GM3EEiiooYysvlszp8jMFmLdHwq3+EM0FFa8bcEhN/TQ
   IeQ5p34tviCjXWgA1hf48Mm9C5dUj/0et+8++s7uFc+7Fbhbb2CUt4r8R
   CGcou9hBGMz42IRhZFsxMKp8NCSDWk6ziZ3fwVJq0te199FPGRuJrBYlT
   jhyObDKCu0cXZL08PXGXUhgFu+CnXX5QTWzvyJMe2C05ECxSHWy5oz1ex
   hioG+tD6/7/tnD5tqvtmUSWXhn3gX09/0WjSl9qWt1qY1L7vjUu/bwqi1
   38UgGr6+hvK1Etb1sWMqKH5SE+/p5/yoDdJGqQqMS6QETTPKkf61kJ0uV
   g==;
X-CSE-ConnectionGUID: W73rh6iMT5Wm84SuoIuUnQ==
X-CSE-MsgGUID: UuV3KeytQjm028orE0D2uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4030523"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4030523"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:10:08 -0800
X-CSE-ConnectionGUID: 9JkuMbIiQzuuIn8yWWFq5A==
X-CSE-MsgGUID: 6/TDC+NvTm6xNx+oMgBc4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10637160"
Received: from linux-pnp-gnr-1.sh.intel.com ([10.239.83.186])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2026 22:10:06 -0800
From: Jiebin Sun <jiebin.sun@intel.com>
To: edumazet@kernel.org
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.c.chen@linux.intel.com,
	tianyou.li@intel.com,
	wangyang.guo@intel.com
Subject: Re: [PATCH] net: dst: Avoid false sharing between tclassid and __rcuref
Date: Fri, 20 Nov 2026 14:14:30 +0800
Message-ID: <20261120061430.3676313-1-jiebin.sun@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAL4Wiio=6iUnMQM1Ry+fda3Y2Y3=d13_g42e5ZHhXHDmhp7eFA@mail.gmail.com>
References: <CAL4Wiio=6iUnMQM1Ry+fda3Y2Y3=d13_g42e5ZHhXHDmhp7eFA@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Eric,

Thanks for the review. I tested the field swap. On x86-64, dst_entry
stays at 136 bytes and metadata_dst stays at 240 bytes. VXLAN
metadata_dst allocations still fit in kmalloc-256. I included the
pahole results in the v2 commit message.

Memcached over IPv4 loopback (64 threads, 5 runs of 60s each):

  +----------+-------------------+
  | Case     | Throughput change |
  +----------+-------------------+
  | default  |           +32.55% |
  | hit      |           +45.79% |
  | balanced |            -0.12% |
  | large    |           +45.62% |
  +----------+-------------------+

Thanks,
Jiebin
