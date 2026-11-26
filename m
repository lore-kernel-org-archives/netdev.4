Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680280;
	b=Ram15748hP524ovty7Izwi8efAnRr7Z+HcCJnY8K8giZcq+wOKXYxS7wBLgAHBG69rSp
	 aLHnfs3dtIkyc+0kAW6C2Dbtyr6iz/kIhMBu6Z5bhQgiCtZzTZpAFZIMrsi6GK+1IXYwp
	 XmpmGrEck7FF74IKY050cRH0MdG1lyQT+5j6OjdbYs0Ay2iBCTr5np63GoovcyZgYliGT
	 qS6BzlfVl9s4mHUmUXRdpl6qrxH2NJoQV+vetXJ4odbP1IPd6MPjtZelGUIh3R4G+NIed
	 n+1/MHowl9RY2DKVSHzhdw8WbA1sWCjg+t1oAXdNAToWTfNCiRJjrZlQ1AgSluJROkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680280;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kWM49q4AmimCRFIxi6Oy3KBYHBdNqpoDYmE1DZJaj+A=;
	b=OI8op2ITxaqYFvjNXW79OqsCjm5QTr1T5MYJhwxo5tPQKYhwX5t65b7eWmmTqfEWmfpN
	 MaAdMjExAL0eq31qMkQbK2y5yOog2qTQwfs+rA5l6V6+cyMqaz6sFESdUgWnyueUDu/o7
	 tAi0r376vEcRcd0T/drDTKrQKunrYct18SDh9ZwfxL87OdG/2JUcFgo3IX4YCMHsJDgr2
	 WHMW1/lQfhRbkuJCCcOhAEDaBxBXGRIBCT3jO7FH+vd4xq9UQxxDM95hbFaVWcK6jYjPb
	 FP1IO0VnjHiWG9P6y+8QYI4Jqmd1j2SrZ0NrXOWI+MEoWlHmSrh65aePc1946SJPQ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nbbOuYdY;
	arc=none smtp.remote-ip=91.218.175.158
Received: from mta0.migadu.com (out-158.mta0.migadu.com [91.218.175.158])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01873606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01873606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nbbOuYdY
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kxNBocQGqfHKtHwlKawh/nuNl+S5U4ueRMwxFQP7u7c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795680277; v=1; x=1796285077;
 b=nbbOuYdYq1PdbcvkFIjgA2fhvbkJA8/Maln0a+vqH9O4u1T9CJw2NkuJAWKmqgtJe7dPlBiV
 SBgBuyT8A1dWzVwhvoFUbjMzyG9/QHvOtYSKw+j9t2Xroc7dHkOPHGA10H+/eYEEAJI6+htrGGp
 YQvc3EIG8oCBcdSCh5TmQlsA=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 05a3466518326d7c;
	Thu, 26 Nov 2026 08:04:37 +0000
X-Mizu-Trace-ID: 05a3466518326d7c
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 16:04:29 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "jiangjiehua (A)" <jiangjiehua1@huawei.com>
Cc: netdev@vger.kernel.org
Subject: Re: [PATCH net 0/3] bonding: ignore updelay when no active links for
 broadcast mode
Message-ID: <20261126080429.GB33976@Liu-laptop>
References: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
 <6cde295b-4c7b-4878-8fda-3732a2ff7c7d@huawei.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cde295b-4c7b-4878-8fda-3732a2ff7c7d@huawei.com>

Hi Jiehua,
On Thu, Nov 26, 2026 at 03:28:52PM +0800, jiangjiehua (A) wrote:
> Hi Hangbin,
> 
> Tested on v7.4-rc4 in a virtme-ng guest. Ran recovery-updelay.sh (21/21 OK)
> and the cover-letter Test A/B; both match the expected updelay behavior.
> 
> Tested-by: JiangJieHua <jiangjiehua1@huawei.com>

Thanks for your testing.

Regards
Hangbin
