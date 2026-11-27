Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772740;
	b=EJi9SbueavxWSSNDr89wnXKHIfQtf15GgsWB3ga9DIbDLk5D+uZXh+ovrBMJah/HcsZi
	 VQozxleVUbqg220lGQREebsyeLl5hg7kjKJvpCleT0irIEy/BOiwit/mNg0dEDOkVOT4n
	 gglzlNvYTuZAmVgLh9O2OTUOC9SIf1kcvwKuw5C1ygdEmfoXcKfoQPwHVAZ5/tHMpci2h
	 +82eC5iQ8VSBFuss4fdtWpDNH6S/xRa0WIKMaTR4xQirb+Ii9he5ZQlzujAIeYeqP0ei4
	 TER+whnZTBX51n9JZInPEXL25TeI8VG21KQ9cFKyZzTnxA9NyKYRqCe2eEWSlzdcLfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772740;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7ZKieP0VtqSuBcVc+eZEfm3S01FDg4V69RKq9hXb114=;
	b=lDug4gmTpyUfGh3/yXvDDhBW9l6k/IfOrJJrPjuTRuEjP1y5Xde5xUObnpSvwa1/Zm+/
	 3iviVxRUofNhVNKdg3ZBKNxwPkyP9kMWPw+JrE5Bpk5k/5/uMSOil+NSwnV3hbbjAvPBo
	 1oDIzAH72PgoQFcO7CFCcbKXMnKHf3r2AmoRUM9EwrDhYt3WYt8oj7hrq6zicbnDGmRLY
	 o09f03Qx3TjqeECvvrg3bV8QhVpOdGoxGoWrn1ztx3K5AYXVCF53g0lpM8eQFsM1Ry4ie
	 RYdU3qoTmV1EXXx3cGzetmCl7QpxTZZdd/19ud1eq2Xe6RxaZ2tF2q3Oqb8VeMp1V5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="n/fXzQTD";
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31DA606A327
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=n/fXzQTD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795772748; x=1827308748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3gYc0xMLNfm0Bgyyrl6ky2LOho/0ZKRGgYnoa3jGCuA=;
  b=n/fXzQTDP896vyJIIBMk+mfSYLo4RoePQvfDIRuh1puN0kPE/loFGvxS
   dkMnYbXRdz3gaddtvaeJJ/Yc9MCP3qTyYG26RfAxHAasJH0p2G+GKvCYL
   HJjgenUuENpxkk3mZ4k5oq8mmq5rzp4YKHnaA/rDKYX38YUYSfGG0Zlg+
   MnM90PRW90IUqaiJWo64uFp+b6aXu5sXvO+8c2RPJAJigb7Ph5RTHm+k5
   dS1AklvgvPWbf1bcX3C3njArpPjzyaRKjHDp4hTN7o3fDH7yfoAhXtcEk
   SKbA92b2IS+3hqcU56tTk4IgzQpJWkzIehwD+gUijRsvBziN6YRlGJ3hQ
   Q==;
X-CSE-ConnectionGUID: pV31uTVCSyuHNP6sdG+iUg==
X-CSE-MsgGUID: xipCMtnURkSocTfvhWSZMg==
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="234164086"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2026 02:45:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Nov 2026 02:45:38 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Nov 2026 02:45:37 -0700
Date: Fri, 27 Nov 2026 10:45:36 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
	<netdev@vger.kernel.org>
Subject: Re: [PATCH net] net: lan966x: fix disabling timestamping without PTP
 traps
Message-ID: <20261127094536.xejnqlz54ynmhyhy@DEN-DL-M70577.microsemi.net>
References: <20261123-lan966x-ptp-del-trap-v1-1-3f46ca6072b2@microchip.com>
 <16d457c9-ff01-4ecb-9b50-1daa2be6a255@redhat.com>
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
In-Reply-To: <16d457c9-ff01-4ecb-9b50-1daa2be6a255@redhat.com>

> On 11/23/26 15:53, Daniel Machon wrote:
> > lan966x_ptp_del_trap() looks up a PTP trap rule with vcap_get_rule() and
> > removes the port from it, or deletes the rule when no other port needs
> > it. The traps are removed whenever timestamping is configured with
> > HWTSTAMP_FILTER_NONE.
> > 
> > Before this patch, every vcap_get_rule() error is returned as -EEXIST,
> > including the -ENOENT for a trap rule that does not exist, so disabling
> > timestamping on a port that has no traps installed fails. This breaks
> > moving the hardware timestamp provider of a port from its PHY to the
> > MAC.
> > 
> > Return 0 for -ENOENT, as there is nothing to remove. Pass any other
> > error from vcap_get_rule() on, as the rule may still be installed with
> > this port in its ingress port mask.
> > 
> > Triggered during test development, without kernel modifications, on a
> > lan9668 board whose LAN8814 PHYs are the default timestamp provider:
> > "ethtool --set-hwtimestamp-cfg <port> index <switch PHC> qualifier
> > precise" failed with "File exists". With the fix the same command moves
> > the provider to the MAC.
> > 
> > Fixes: 72df3489fb10 ("net: lan966x: Add ptp trap rules")
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> IMHO this is borderline for net at this point of the cycle. Any strong
> objection to move this one to net-next?

net-next is fine. Does that require a repost without a fixes tag, or can you
apply it directly as-is?

> 
> Thanks,
> 
> Paolo
> 

/Daniel
