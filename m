Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773346;
	b=PmZnoHPN0DO9WOwSa6Ci9yu+jfN8DILSBwKzUk0bMsOjIRhK9vHfGLJaX6BbGhiKKEFp
	 c4/QDqyNRDA7djOZ542IwUhPwKC9NkOBnKNLOKUU3bAtCt0mJVxigsYFH6yB7E8ZDbprH
	 C6ODzKvnHCAmcKy3whMn6XmCrnPSNIYrIGiNyCR+6IFltVE+xtbdkq15Vp8ZZ/Dx+87gs
	 Eaz4rZpVhuBsqntuxY0mFAODjF2MAVIYhD/xbr1qgGenU9u9vxt5mNi3V6lgcQt5RTdSQ
	 4UzipikbyQQWsTXSw1hy1kalpisEFgbchqeeJO73hY8gsvG6NhNXDWO1/4JPWXK3uww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773346;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Vnq2cvzR+T45NbkeYUki35hTD46eHhE30xnjedOGMKE=;
	b=muRp5NGgXyyJhuYfBdLOi9x3Ef0dOXwg818z+41dR6T8RjAb3euZVtUhiwnVHkp0qOPY
	 klq4BGEPAv4zlehSvaMy+jlAwSF+HmlY5OYoLWB6evJt6RKGqstuzHvY40cmsmdHqIqun
	 ZH/NC60sD/sPZ20xlANxBCXD1zXz4GPDZcA9B4XpGamBxSYFmCsieeG0Kg2lLpiTqI+se
	 sp+axYMPtx4xsY04c1WA5OixROMIiYVaJkcA77SbGd6cTwe9dRuAfKFwz/Q0L7q9VjIAe
	 s/Ay2g8bnaRkdfjX1c2Q/x/j8uOWpUTsZKTRbWXQHaROUgDyweJMfJQXgxJKzvEEBGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Yo6ry2jO;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6D606A327
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C6D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Yo6ry2jO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795773345; x=1827309345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TJXJv2Jg/Z9T9C0MJjr55Dl/rI7ViwUF25lE2jE3MwU=;
  b=Yo6ry2jOR2HKRoiKlrjrp0PsfDpImJejfVH9KdIESriehesiJrMc/XDP
   GpDImY74iZPjs6gxUOvogbcNmLZJnzGtWZQw0fW8UbaLHqrTef6OZcONn
   l8By/7hRF9LdDT1TlVNEziA/o76wsNHgey6cPuShOMn2fpdV5SwYWDgma
   ufKNBChZ+fOZxOAPrWHWPoyjefKss+jElMo+zfgWccfCPCyXzbhflRdVT
   yjWwEgWRBzNAmRrRtdSRh9IHIr99fEuJb00wHut1WvhrK5W8YrA/I1VxG
   jXKtOe3m69LW0Gk+pVvjKbFAgEY3YKlQu+oqZ6ZAQowyy8vtCL9zmRaNv
   w==;
X-CSE-ConnectionGUID: OWH63shBSoitzScPY++f8A==
X-CSE-MsgGUID: 7H4uBvlmSIWNlr6J5taGAA==
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="66146002"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 02:55:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Fri, 27 Nov 2026 02:55:44 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 27 Nov 2026 02:55:42 -0700
Date: Fri, 27 Nov 2026 10:55:42 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sinfo@kernel.org>
CC: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next] net: microchip: vcap: initialize the top
 address of every VCAP
Message-ID: <20261127095542.iiiv5xad44jrsaay@DEN-DL-M70577>
References: <20261123-microchip-vcap-top-address-v1-1-fd1953fad422@microchip.com>
 <179544593891.3294.14856771777951641475@kernel.org>
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
In-Reply-To: <179544593891.3294.14856771777951641475@kernel.org>

> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Found by an AI code review agent and verified against the datasheet. Not
triggered at runtime, and hardly a fix that matters for stable, hence net-next
without a Fixes tag.

Regression tested only.
