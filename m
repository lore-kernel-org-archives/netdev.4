Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088901;
	b=yecgnRaeORbReo/tDSDSsKXS+7APJC2tltQji5peYGVIACBKeJ/kU4MsrDpvfvVQIUaP
	 6U/HVB2VvGaN6WCMmnOQMZ7b52h63Z/9P9Fk3p/UB3hZoZxFm3tPkFuGvuDinyK+rYEME
	 pSuSVu3K2EVzkAsJGmqVWROKJXgQgvV96A9sTbb4/xtl4Gb/xW/E6m99eTYiw+9P6PpsY
	 E82bUiCbz5AJ7qhYr79NJaDnHc9GcUtxMY5qpDInD1u4JfS+uV58N2U1kJ7gzQrovWhta
	 Y5i34qDUEUNtm6top8KTjAe/hp/xhnSQszK6yIvyl7hcAsThQWrjFsW/BcR/c8B448Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088901;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=C1KEPAVwJKgelmptz1dhOpkJvO7sk8o/xU+AMkKabIE=;
	b=cd9+QIRnct2+BSU7N7tXBRj0oApwhpJfOiC767rIcC6yWJsC6IWYRcaFrOzgipCnx8vm
	 1XubsXXVkxJrPitVgKLcs0oAtYxiUMOPvyYnJwoMNgrhYdkBnxPOeT3iNAcFzv3ugii4E
	 DwuNJij1dBRdBQYf/kR8/0Ot1km9yhAR0Jw9JexcTwLniA7NFEP5vJ/oViEEC2NcPyZhU
	 s78COX4CK0/+UstbJunTgEzbox7iRwahs3A2mGfjFlOg6EIUMPtq/9ZojBDOD80SrBWd7
	 mIdcj2N4XmoDrZhW+1jcri2S8iWSu9vZf/6W71542vG4bwwNkoEp88d10X0nSySXlXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="zO1yV/nw";
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D54606A320;
	Thu, 19 Nov 2026 11:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D54606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=zO1yV/nw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795088901; x=1826624901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r49YBGXiSVg5CFzKUx0B5Ww05w+BN0Z3o15Oa8cU6LY=;
  b=zO1yV/nw6rgQuYXIPUJ4ptP2TBEiqvLEf4OYjjQvePcPzMmdjUy6wxDE
   NVP1Xuo565iPw+51t8O4kxCqUqYX8rXB/rTTfkxpyATPqgO40zXXYfC0T
   59cStawqbx6uCPWiULg6HGYhMMnDnszNDX/RASeLOOHJlTbw+wFBjlcik
   J13ZUQ0f7IIUoFjYwi6u4KSbGvYck9d2HYo2WTDi64ZV4SDtcSmnRTYQ1
   gv9mgN3mNI9dtB+1IAGsllLIN/lyZbev8ml7upE+0UgAGT1gVBIUhUpK7
   RctlqthljNhc4GYlZ6F5UGp9fp94h7f6MQVtyYgAI79+/ZqSOjRmjZ73L
   Q==;
X-CSE-ConnectionGUID: 6TgGWq0RTqKteks0LOeXBg==
X-CSE-MsgGUID: 2JN9bLgoRVWtjxK9tnoY8w==
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="233813092"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 04:48:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 19 Nov 2026 04:48:20 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 19 Nov 2026 04:48:18 -0700
Date: Thu, 19 Nov 2026 12:48:18 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Tim Douglas <me@timdoug.com>
CC: <netdev@vger.kernel.org>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: lib8390: avoid truncating the expected receive
 page
Message-ID: <20261119114818.3nm3d66225k4a5le@DEN-DL-M70577.microsemi.net>
References: <20261118022217.84500-1-me@timdoug.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261118022217.84500-1-me@timdoug.com>

> For a receive ring ending at page 0xff, the expected next page can
> exceed 0xff before the ring size is subtracted. The value is
> truncated when stored in an unsigned char, so a valid frame that
> wraps around the ring can be rejected and queued frames dropped.
> Store the intermediate value in an int.
> 
> This was observed with the 64 KiB receive ring enabled on a
> Farallon EtherMac LC-TP. With the fix, three 16 MiB downloads on a
> Performa 6200CD using a kernel with local platform support completed
> without receive errors. The pcnet_cs driver also uses a receive ring
> ending at page 0xff for Socket EA cards with the large buffer enabled.
> 
> AI assistance was used to investigate the receive errors and draft
> the fix.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Tim Douglas <me@timdoug.com>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
