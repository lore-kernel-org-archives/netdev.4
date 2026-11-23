Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416470;
	b=Qe1o+irK9aypNvhAHd7ODdzHnSK2Ar037GwqeDFpJLf21UegORTgau9UUAUJDJTxqZnH
	 4uUtAelpB0A2rrlem07miPGkuNeb4E+zKiULEvxawwdH12cda4P77wBNrRcVcUT/1yyOI
	 EtWxu/6Z88z0Ct14/8gC0eqJK0r9TnHytHZckELHInXhcDq1VpBW5EgbBIgYHRrnf0zdt
	 C6tHrD7FJ0FKVmpAT7Cx0qPfz+WS/LbmDOYBYlesGdSpAmuhNCtp2FgEYnoe6yzY7+4Aq
	 /GoTOh6Hz/d4/UeMzLfuUa2SmqxOKe6Fxgplq2QEBA8JSCnmyQEw21WoRCSgOTNOIMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416470;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yK5ngLZXx6Tos8NbEXzOtfgfaelw6reSm9n3JET2zIo=;
	b=IwwFVGOuNsy4Nj7UWqmrRns6aeX2qNzF5fOe8iF2yB1jAmZHaE4+l9nkMVfeYrd0JFDX
	 WVNTE8BUs1MYncfLew5avTX2N4+ceRZeZMFb5ohJYRs39kVRwxSdhTU8gfdJxpXuj1z6G
	 KVeurFDpzIa0VKbLIM794vZbF8KfrZJdQQgiLKvGzc/NmecNor4+KIKmirlPeqeMflxzg
	 DkoFL762VGzDrnUDHy7qK4V9v8u4Ny2DZlEwda5FsYikukAdM2vxHTnM4dUH4gUk4RnCf
	 Mpncurs3fLiv9DUXSCZRbK08pjV8Odma0cR9Rn35p3D6JTwqY+te31/M2pCEemiLVQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=motor-comm.com;
	spf=pass smtp.mailfrom=motor-comm.com;
	arc=none smtp.remote-ip=115.124.28.121
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B5606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643B5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motor-comm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motor-comm.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08357049|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0447854-0.0127401-0.942474;FP=5796420354602225591|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040092104;MF=frank.sae@motor-comm.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.k86P.7h_1795416458;
Received: from motor-comm.com(mailfrom:frank.sae@motor-comm.com fp:SMTPD_---.k86P.7h_1795416458 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 23 Nov 2026 14:47:39 +0800
From: "Frank.sae" <frank.sae@motor-comm.com>
To: andrew@lunn.ch
Cc: hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	lingyu.zou@motor-comm.com,
	xiaoyong.li@motor-comm.com,
	jie.han@motor-comm.com
Subject: Re: [PATCH net-next v3] net: phy: motorcomm: add YT8831 2.5G PHY support
Date: Mon, 23 Nov 2026 06:47:38 +0000
Message-ID: <20261123064738.1576341-1-frank.sae@motor-comm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5781d5a7-68e8-4837-8eb2-c47ec2f75507@lunn.ch>
References: <5781d5a7-68e8-4837-8eb2-c47ec2f75507@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> > > Please break the patch up. Add basic support as a patch, then
> > > downshift and WoL as additional patches.
> > >
> > > The WoL code looks wrong, i don't see any calls to
> > > device_may_wakeup(), device_set_wakeup_capable() etc.
> > >
> > > What exactly is AUTO_BX2500_SGMII and how does it differ from SGMII?
> >
> > Hi Andrew,
> >
> > Thanks for your review.
> >
> > I have split the submission:
> > This v4 only contains basic YT8831 PHY support.
> > Downshift is not implemented for YT8831 at this time.
> > WoL support is removed from this series; I will fix the wakeup API handling
> >(device_set_wakeup_capable() / device_may_wakeup()) and send WoL as a separate follow-up patch later.
> >
> > AUTO_BX2500_SGMII is YT8831 chip-specific mode:
> > When operating in AUTO_BX2500_SGMII mode, the YT8831 adjusts the PHY media side to 2500-BaseX or SGMII based on the connection speed on the PHY UTP side.
> > 1. Media: 2500BX – UTP: 2.5G
> > 2. Media: SGMII – UTP: 1000M/100M/10M
> > Differnece from SGMII is it also includes the 2500-BaseX mode, which is switched automatically.

> Ah, O.K. Most multi-gige PHYs do this. Basically there are two
>different ways it can work:
>
> * The host side changes with the media side. When the link goes up,
>   read_settings needs to set phydev->interface. See
>   mv3310_update_interface() as an example.
> 
> * The PHY performs rate adaptation. The host side runs at a fixed
>  speed, e.g. 2500BaseX. The PHY then rebuilds the frames it gets from
>  the MAC, buffers them, and then sends them out the media at the
>  speed negotiated. Pause frames are used to slow down the MAC so the
>  buffers in the PHY don't overflow.

Hi Andrew,

Thank you for your guidance. 

I will update patch v5 based on the way of 'mv3310_update_interface'

Frank

