Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008237;
	b=BTh/3yZft//G3oekqAXKWgFSGldqi4bYJPWUdxiaS9eLan3UNUtcpgSYRJBuYy3kTvCL
	 3yDsrrRSl6lio83WhCBR3Srp78MIQI75RTch2625xSMdxt2xlHyhaEEJG1t1pweTYcsnM
	 niTT4w+vgY2xrdIx+bqDvo2bYYcZ3wxBov61ZuupzGzLBUJ+kESNx2k67t1IvPf1wrnlr
	 0NnwwAl8rBDTWcR0AwuyhjSunpS+CbnFNvmsuUqWCBlHb9vwj/aPaTlhAkzE6rRniiIui
	 uEAT68B5X2Za4ZtEUFF8Bw/VJEBPv5ADOq7cx1BwsC9XQZOMIzmtRXENFUW9VvvuT+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008237;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=397vhIFiqK0VX8uLK5k207ooRxnaZvzsYO45W2jXP9Q=;
	b=S+RCabeK6gRvzAyLNkcWdVtDqA/tx59+1Sxj/leTyBblJoGv/IZDICo4WTlLyIorO+Oo
	 73UcL6J5l4m1CLE212/4aLlUkeWKdXhz99O3P9OuYoUAVlXZO+yCAk7CpplnvjisvtG17
	 PgERRBX2uyxWFmy09cTEJARYIUfIORQWYZCBMnkQtR0wGjAEfibhO331sa4fynDYeQHKr
	 GbHCgQhz6EOcerTxltaF/m2m/lEaAM+TRQC9gTuTZPKSo7O3Ccqensk5aRYN5CQiYbha3
	 PYChZlc2St1z/T9K5PomsLHoerRQczsmeEYlF4ASVlg2U9VlQzYnfOBs8gaQfYkP5Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=yKjWdM+K;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F0C606A31C;
	Wed, 18 Nov 2026 13:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F0C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=yKjWdM+K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795008237; x=1826544237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OZEEVTLUB3jevmB4KOdPwJHRwAUA+Qi5MdIqoD6hVHc=;
  b=yKjWdM+KmOg57NDdqWeA9rQ/iGSXnA+0ows/oCxhXJDMNPGWnksiIti6
   3tu6FUZUQfV+2X+vhaxgeZu7PbIuxmTPI127ZDZ3kJNaglW4zsgDrCz9J
   9HQYkXXrSmR1LMVi3oXTOQjRh+r7DEt3cgf+pTXtWy3Ph8uXnXQaHy+g+
   PZTXLqmb/l16pJB65s+x/DiDiJrJqNeIBuNZrZSnEWOlWmiohul4koufV
   p7zqGGtZWOcGwKMESrm6cnCm12miqLvB3v+9Wp7s4BSv0UR8dRzP1L3s0
   CngVuPgs3Z3Td0MlFoMNGsMcjUG1GdTeAMkxg6f0q2+dPtV2SfX3sFGJ+
   g==;
X-CSE-ConnectionGUID: cORQJduaRCqCLdiX6mZMjg==
X-CSE-MsgGUID: hqm/j2cET/Wvb5TSHIHTTw==
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="66933088"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2026 06:23:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 18 Nov 2026 06:23:49 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 18 Nov 2026 06:23:46 -0700
Date: Wed, 18 Nov 2026 14:23:46 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Hangbin Liu
	<hangbin.liu@linux.dev>, Fernando Fernandez Mancera <fmancera@suse.de>, MD
 Danish Anwar <danishanwar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>, Ravi Gunasekaran
	<r-gunasekaran@ti.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <1342116488@qq.com>, Hangbin Liu
	<liuhangbin@kylinos.cn>
Subject: Re: [PATCH net v2] net: hsr: clean up synced addresses and allmulti
 in hsr_del_port()
Message-ID: <20261118132346.zagm5ofoyfvczth7@DEN-DL-M70577>
References: <20261112064716.85381-1-sunwenbo@cmss.chinamobile.com>
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
In-Reply-To: <20261112064716.85381-1-sunwenbo@cmss.chinamobile.com>

> hsr_set_rx_mode() syncs unicast and multicast addresses to slave A and
> slave B devices via dev_uc_sync_multiple() and dev_mc_sync_multiple(),
> and hsr_change_rx_flags() propagates IFF_ALLMULTI via
> dev_set_allmulti().
> 
> When an UP HSR device is deleted via hsr_dellink(), hsr_del_ports()
> removes all ports from hsr->ports before unregister_netdevice_queue()
> leads to hsr_dev_close(). Consequently, hsr_dev_close() iterates over an
> already-empty port list and cannot execute dev_uc_unsync() or
> dev_mc_unsync() on the detached slaves. Likewise, when a slave device is
> unregistered while the HSR master is UP, hsr_netdev_notify() calls
> hsr_del_port() directly without running hsr_dev_close(). In addition,
> hsr_dev_close() does not release IFF_ALLMULTI on slave devices either.
> As a result, detached slave devices can retain synced unicast/multicast
> addresses and an elevated allmulti reference count.
> 
> Clean up these states in hsr_del_port() when detaching slave A or slave B
> by calling dev_uc_unsync(), dev_mc_unsync(), and, when IFF_ALLMULTI is
> set on the master device, dev_set_allmulti(port->dev, -1).
> 
> This issue was identified with the assistance of an LLM-based code
> review tool, confirmed by reproducing the retained allmulti reference
> count and synced multicast address in a User-Mode Linux (UML)
> environment upon deleting an active HSR interface, and verified in UML
> that both states are properly cleared after HSR port deletion.
> 
> Fixes: 36b20fcdd966 ("net: hsr: Add support for MC filtering at the slave device")
> Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
