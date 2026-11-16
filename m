Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868708;
	b=MAYXIrsQf6LeAoPoAeCWi88CSY08IWwGKz4hfoZ1gXIjSetUPByLm558xXHq733zDRJn
	 xxhPH4SowBprTUvvIoc6AGISkwm1VyhSJMwUKcoMxNCvO3TH742xiMvgHAbdhliZvdEgq
	 gaqKy/FJzOazv4922RJhKpjdQiaK8hLxCJ7smr08+x6bL0opNYmoygcAtPQes53LJcZFU
	 mHTpK7Urt3kcLF2jKPkK08fCuv5v9z8yX3FnrEcjyWTGeolv/tpgJFFgJVWkpVd85r+a8
	 hDlkWd+g792wb7whuD3HI59dVmGksFiWakJhxOzosdMPtJbau2RXYY1dmMll3FAuSOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y3Irv8gnA50dP3BHRAY1GWOYLzyQzy8xzre6UHoXv+0=;
	b=Y/EmMjVHPgJJXqEWQDsxUCwx4/8Ms8SmDj8kEKe/AEhW7XtQGPlk9cezasICMKE/QtRV
	 GG8F7QTZqxUzahtDLmx0aE/Peq4MGl0j2Ay0Iht/FdM+gGAqnspQA3sKFHaPNwNtN/T4I
	 /3IMYch9MXtNoSbN/OGpAHfXW5O4lNiUjmgFp0KR/PA9KNV/xOl8vBDrpNXeTivsXSTK2
	 /ymOICQgkcny/5SuiafQadltiOMMSLVVZ9uYcXgd/sr5mn/OewtUXz/J82hDrm+qAc+zG
	 cxLtTUhSSSRFdkepr9Ms6syhFVV67hvzUHYBG1+PgP4ujgOTDhBDN77RRe/F0LzXAHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qjjWXvcq;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F68606A88F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F68606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qjjWXvcq
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c45551fa84eso759726066b.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868696; x=1795473496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3Irv8gnA50dP3BHRAY1GWOYLzyQzy8xzre6UHoXv+0=;
        b=qjjWXvcqKWNa7pAFOTMeSE6B2E+p+77wVXq2bS4Pi1PE++2wSGnEoBRlgM+3A9D0Wc
         tyoIyQeOOvVrA8Dno7mwLd0Z8XMk7nbR/jDTF85e84bRPnvTPiEUFWKMXnJ8UaxR1HET
         EsqDajdKiZx3jQuyeSiQKtxi/+Oyrb5y+HbvAzucQnqTmipJQhPtV+H8e76cIVTehMz3
         kzCAEGluYQyccyGiuuNznVXh4ZE/KkENATQLypnvtX7UzLYRBjM+FkAJr/lAE0OS4oof
         GKFYzi/IWidS3d0ozzjmHXWkpk+d5zLd1rAN7kAmW6hVCZevXoI5oxuRnJC1tskIpU5Z
         /JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868696; x=1795473496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3Irv8gnA50dP3BHRAY1GWOYLzyQzy8xzre6UHoXv+0=;
        b=W+QrXSPIckWnVurvx52jHq2zCWqV8UGjrTfFTDAMj/g6/GXLHurDJrTTp9yUl4S5Jn
         64SWH1weXoi+dlBS0TrMm0ZK9qt/Hh2ndC5FIfMdL9DjhW94fJZXUqhLISykZLCb96kb
         c6t6xh7Lpo4p2KON9JgM4XrJeaa42Y2rkpm7AlQm1LgmTLetIb83mJVSpeON7DDkPN2t
         03UM/Yuk/oihSnfjvnKNvXJRuMs1X3xpnWO7NMBVTceL75v2mKPUN7FhWXqDo093gOG3
         lugsma352fqVxQwt8rCRWwj4QGW/zSzA5Q2QEn/sD/QKa059S+Hij0DgNpHu5JnkUD3j
         S7bw==
X-Gm-Message-State: APuU4Z9E7Q8KXwu3sZFSg1nFxVpSPabuTBcedXq1Hnuybxb1E7pMANZl
	xtAZ33YJJZDfj/xc02G98Is05PIbQ8shvEAfF5xFXhTuTAva0TyZJibQ
X-Gm-Gg: AYBFou1RkRex+hbyDeSeGP2KSLxfH2VnTny9AB0v/67JAYvbWDgOukFpbz+ugIRO7qF
	3zI+qgDBvZNa5lPDKaFkgx8oddifZuB6vr9UwMjM+eKZkmSo3g9OxR0vA/4JfhH58bvRahAmZ8w
	dLXbYGLoT/O9Hr+1ST2k8KIA2eql9j/LneeiOGtDVvdTluVSUXM0jm8cw5mhL7l6vc+hnyGJ38C
	U1ppS6W6x/+iUsu0xEM0x3MgR+1U77ygNC5mWJt/z+9zjvRuMeVa3Wfzr4CH8Uhrr5RWFcLfeNE
	EH49sNH76M2s/YwvwCd7Nu0Q7S19UyLeoBn+O42oImYu3/BYs6boW4oObraIgosTUWGKlzChGj9
	9WZb6MLpaELX1XSF3lCXtA2E1viJD5sx0687iXsVW9fkaMOPZ3HzwUyf4t7fPOj5nW1hnPIujdh
	SJFyff3vAoUzEiWYvW1k/2s1nHneqy9Phyq4SjTXRpgGcxK6e6R/2Y+78Cj0SpI6iWVXnCKoi+J
	xhzVhFES5M8XcW3dALHzt29NtImLvAtxf1gPvjd1oUOzuNs4Q1mZs7ivDpT1IKt5LWrgrjxBmvf
	OQQtmRnAO5jmRjNX97iujMQL598Ll8heS5j+dhHH
X-Received: by 2002:a17:906:dc8c:b0:c46:ba0d:3728 with SMTP id a640c23a62f3a-c50963cb4aamr942275966b.18.1794868695442;
        Mon, 16 Nov 2026 14:38:15 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm477805666b.75.2026.11.16.14.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:38:15 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Mon, 16 Nov 2026 23:38:13 +0100
Message-ID: <20261116223813.980043-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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

On Mon, 16 Nov 2026 13:34:45 -0800, Florian Fainelli wrote:
> This patch series adds support for Clause 45 MDIO operations within the
> mdio-bcm-unimac driver.

Tested v2 on the same TP-Link Archer AX6000 (BCM4908) with OpenWrt and
Linux 6.18.55, again in place of our own C45 support. Patch 1 needed the
context of one hunk adjusted to apply there, because OpenWrt carries a
hack patch that adds a function right after get_phy_c45_devs_in_pkg();
the added and removed lines are unchanged.

The BCM54991E at address 0x1d, which our out-of-tree PHY driver switches
to C45 in probe, still takes its firmware over C45 and links at 1000
Mbit/s, the link comes back after ethtool -r, and 8400 C45 reads through
SIOCGMIIREG gave no errors.

This bus is registered from DT, so the C45 scan does not run on it. For
patch 1, a test module registered a bus without DT whose reads go to the
UniMAC bus and whose writes fail, with read_c45 set and phy_mask leaving
only three empty addresses. On this UniMAC, a C22 or C45 read from an
empty address fails with -EIO. With v1, get_phy_device() for C45
returned -EIO there and mdiobus_register() failed with -EIO. With v2 it
returns -ENODEV, and the bus registers with no PHY found, as it does
with C22 alone.

The new check in unimac_mdio_reset() still never matches here, as no
node on this bus has the ethernet-phy-ieee802.3-c45 compatible; the
PHY's node has only its ID compatible.

Tested-by: Kordian Chmielewski <kudzo51@gmail.com>
