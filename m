Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.31.204.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596350;
	b=CS50k+Va+ntm3IjhCVnV34LYKX0+watMkgsf1Ave+jcHUZxWHDfKp/vxIDAgH9E6H937
	 oY5DQY8iVQxkmwdYuvUUxpTBs5y+OgrDeCqK5RNAig6AQ+FGd7wd2eSIFNvGmRaIPykZJ
	 QNhUATy0iUgvsGVm41P/jHz3FBGbGqBlDM7XffsfRc+H980FwluQQoLs4l6vbnXeLTnv0
	 87vkdUpSsyOiPBxezlXlAq+9DWA7/+EOuWCHqbnCudEXRNRCI4n+SVMESIAq30OpdOUsi
	 l4SY0pzbmCbYje2NHSS8GgDHCLVFG8/nxET2RNDXrcZgO3Zg5rJGFacU+ujshqTYHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596350;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Rspamd-Queue-Id:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spamd-Result:X-Spam-Status:
	 X-Spamd-Bar;
	bh=D4/TLcjDuQtaSzzXjuYZ9vH+2xAI7OHDM17nE/Atph4=;
	b=JIF9U0s6Q+CAjmtdibO0DhSJE0o4HZyWTeRaOVEKxfCNvbbWies9n1uZ5qrw0NcXwpBA
	 sFQrgrMdkBcsJ+4VYOvWeqTMWgBmZ6tLrxco6aTl+n295NOBEUmix0Eat87Iq4KDmMK33
	 IQIocas6kwJMcxOCl6VeUn51lQMfqFoWFYD5plp9oUaODWeG5RYw/PusJTR5IL1nRjGrj
	 28dpiYcyp2e6OzU9XzevHsXu/k2ULhf/oyzep8GH5T1nlMygSWZQe68ayZMIcUlweZvNt
	 KSa+dbqPEqEthVKnIX7ROUWr01KAkZYN5oJWwhDKByDbXLrjFw62efxJHn33YlSs8TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nic.cz;
	spf=pass smtp.mailfrom=nic.cz;
	dkim=pass header.d=nic.cz header.i=@nic.cz header.a=rsa-sha256 header.s=default header.b="tstd/pii";
	arc=none smtp.remote-ip=217.31.204.67
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8729606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8729606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nic.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nic.cz header.i=@nic.cz header.a=rsa-sha256 header.s=default header.b=tstd/pii
Received: from solitude (unknown [172.20.8.51])
	by mail.nic.cz (Postfix) with ESMTPS id DF2891C0600;
	Wed, 25 Nov 2026 09:45:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1795596341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4/TLcjDuQtaSzzXjuYZ9vH+2xAI7OHDM17nE/Atph4=;
	b=tstd/piiU+1oM4cwINlWvD21K8N5fq4tNE8Zq9PITgO6V4m+eZ2wcWMxMsMDFOEpzd6Jjf
	Gi7o68gITJw6Un5dYTaosuknttbdbqhQ4gvDMBbajc+lsI4yzPsFTYIx4M2l0u+Z+63bC1
	WiOoB/jA3ApMySB43OcY/aCWVafNbNs=
Authentication-Results: mail.nic.cz;
	none
Date: Wed, 25 Nov 2026 09:45:39 +0100
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, petr.wozniak@gmail.com, 
	maxime.chevallier@bootlin.com, olek2@wp.pl, szymon.datko@gmail.com
Subject: Re: [PATCH net-next v4 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
Message-ID: <awaf-l4FLw0TgpOn@solitude>
References: <20261121091235.1447291-1-pawlik.dan@gmail.com>
 <20261121091235.1447291-3-pawlik.dan@gmail.com>
 <awWkbH3O8IrMYiSF@solitude>
 <20c5e53b-e2f5-45c2-9d64-d279cb884870@lunn.ch>
 <CALC2AphzUqBjgx+JqLTQU8=EizXoR+EKTJjakjKbP29exNNH0g@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALC2AphzUqBjgx+JqLTQU8=EizXoR+EKTJjakjKbP29exNNH0g@mail.gmail.com>
X-Rspamd-Queue-Id: DF2891C0600
X-Rspamd-Server: mail
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.60 / 16.00];
	INTERNAL_NETWORKS(-3.00)[172.20.8.51];
	BAYES_SPAM(2.70)[98.27%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	LOCAL_OUTBOUND(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,gmail.com,armlinux.org.uk,vger.kernel.org,davemloft.net,redhat.com,bootlin.com,wp.pl];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wp.pl]
X-Spamd-Bar: +

On Tue, Nov 24, 2026 at 06:56:38PM +0100, Daniel Pawlik wrote:
> On Tue, Nov 24, 2026, Marek Behún wrote:
> > It would be much better to somehow check for RollBall protocol.
> 
> Agreed, that is nicer than matching revisions - it covers every
> bridge-less variant without a list. Two problems with the snippet as
> written, though:
> 
> - i2c_mii_read_rollball() maps a poll timeout to 0xffff, so
>   mdiobus_c45_read() never returns -ETIMEDOUT here.
> - Returning 0 skips the PHY probe retry loop, so a genuine module
>   whose bridge is still booting at the first read would lose its PHY
>   for good. That is what got 8fe125892f40 reverted in b521003c27eb.

Right.

> What about this instead (with Andrew's MDIO_MMD_PMAPMD/MDIO_CTRL1):
> 
>     case MDIO_I2C_ROLLBALL:
>         /* mdio-i2c reports a RollBall command timeout as 0xffff,
>          * both for a bridge that is still booting and for a module
>          * without a bridge. Retry after one cheap read instead of a
>          * full PHY probe, which times out on every register under
>          * rtnl_lock.
>          */
>         err = mdiobus_c45_read(sfp->i2c_mii, SFP_PHY_ADDR_ROLLBALL,
>                                MDIO_MMD_PMAPMD, MDIO_CTRL1);
>         if (err == 0xffff)
>             return -ENODEV;

And the variable should be called `ret` instead of `err` in this case,
since it also can return a value, not just error code or zero.

Marek
