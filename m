Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819606;
	b=GWDOGDmCVb+KOl8fw5ZL8ll39lanNPFaZPB1kYi2uU+lRZi1X4imwyGQqEzYMeKuCrhP
	 2vjrCEjoIYYQT9F+UGHzxaCZ4DpPet008/n3mwYPpkWiKWT22Ku0RHvxV3VHrTa7ZKhXA
	 FTdAPFYyMaCM9sFv9wn3fn74QrNeefSpOJVMZJYDAPVYKKZxY5DBRQjFlBRwvZL268vJK
	 HCJK05XeLVur003Yq2R5fM/Cz4xblCG6aFBFJ34RSYjD4qjGGXnKovcE2nfDbspYKGJ/A
	 NXNi3LHT8IQXuZd+RBztiOq+zenXScP14R2la3fMI78riNRtlKRv+c1WEhw+qZTkrzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
	b=Cn8C3pEXs7IbytJ+Iux3vwATO1vc4PQFm+115GpMRO/cj8pJSShOaH02lygV14twwwcw
	 u7nzNqUqnv/xA0cbyvEwKD+OCYVko5B8TgriOU0Welc+E/OCH9wB9+ak0t8spcNNTwGzK
	 nn6Xean45wO+/rH4TCT+bD9mwxRGaadTKo4YVE0My11/1bDnLY/YGRgTde+vO3FfECDGq
	 Eqjs4D/MA6lzigq+iuqKS92srIMtIWsfBwmUWX5/EG5QcaePq5WUvZOlRiFRDW/2Gr9ku
	 hecGYMPzzvVchNX+6U/PMoH7C3Du1Oh7q83MlznUu6tvqcDXp5ZiOAMNs9IjVuveSXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNfvVtRt;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E685B606A330
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E685B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNfvVtRt
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-48eee44b908so2511838fac.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819605; x=1795424405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
        b=tNfvVtRtVFeRRn6F4Yx1d12ky5HuQRQs2iLfreCcdSy23EJ0j8AB+6MDzN7qAtW3TG
         Xkg9tkpLQ9Ycslf07hEjqdo5C6YG9Ze/3eLBP8KZJycBbohlgm2+zOdATtDnCyugMaz3
         eY9dWP3Q9pWhM5PFi1w7+b11LbCoeW2fVYvq5KM92aSPTm+TGN/d7NYkX7hnWdj+eNV3
         0p8sCnp1eb/TccoVzAvnXjHD1dRS+shv4nQlHZ89ZOl4EJ1rZuqqfgco4b6XBW2mfNDB
         R/5X8q5ShHuD2k5iHoNuqywYlRPASkWjGakYGodZ6eVAJWosO/EcCPpM8w33jGvlQNyy
         O1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819605; x=1795424405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
        b=c9A3zgXZMSwLB+WWRypNTljNgJdWG7djnlJPDnRURfOP7Agbs5p/wylmOCQyCeaXtq
         8fZMQguVRN1SNavqeA/2GDyxYWVGlmi0yNwKyvgUXYtHfipf9Zwrd917lkZx8LEUM093
         2nid5eXk23zLFj83RuM/ZdUscD/1hV7b+azE7gtdCJhrK05/A7EAj7FbHH+uXpNJj0IB
         CNoqINatffm7oimJmWfY6gJekSMgUHTjaEeVO3e/BIqH5EekTMbaQpmo7MMrjEj6Mhfv
         W4D/pwn/POTXT/cY4QHiGlwHHTlZvoNRBBVnk7LNhwOelHBM7Z5bpFNxf17k7gdAhfyE
         3S8Q==
X-Forwarded-Encrypted: i=1; AL+hErHjsfQsW8Nih2D71rI4ZXOzZU/kbmZZmRuJ61p/+GUNjMiF7/Pv9mmsy4rKzOP9pA376E0DVUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MhqREjogA1ORvRDn1MX2AzKI7+fDhndj2Aqdyzm0+rfci7zaK
	nyUy2SYPkbk2RgD9jVCThAqSeQzxuVCKNDLRCEiD0k59+VYRIwV/yfbR
X-Gm-Gg: AYBFou12iCmNqUEuT8z9ntpTNM+K9EwGelYCYNPiQpbwn2CvKox7DIcA05v/hcn/iPr
	njPhKgLl4Aya8kJ8RHxyfV+7iW7iu1v80VEFnPQ/Xk1pK0e+zFDUxz/DZwaDp3jre/bbRIWmf2w
	H8hZLKR9w2+NMlU6pLwYKxb4/c3r4DS0eoOf3VulXGpbEghDD9ZQx/inqkkRrE+IjyeO9cCRnR8
	O75e3IsZuA3bxIKskk9N7ID6vLTjGan+8gR/i/lAPhUCYJ4hnihGbQlMvWKjpuJbO2Y9I+Hm1kL
	xVkZ/OEqe3EIdoM2rpmH86eOLh5ixRow9ZJGt1dkEUiJnnjESy8VXoNzH4Ggok4n45u1QvfjRxf
	VdJ5d6eMZBLItsf86G8Q+F5M5ukyw3c1r1qDIGDyP1sB1D2m3uuiuJCggQwYNvqMEu7+tUVwvNC
	GXF9E3RhqZtnwWiu/+ioPiWjQNmniHiFdKdMgu0TaIBdzdAN0F0mheLrMRahafYdA88qrMSXi4o
	Ejcn/msoM5quA55LzhvfFct6OvO6++4AGPle4BvMHXB/RJl3HxjlyHlHlltFdeV+IrgFcc1TcZc
	y3IGN40Lc2qK9ZFmBYpB86+woUz6FL2UHJNg9ImoXbxdS+AhGkL/P28vnHKq5+V4gGN2DtMzN8D
	N0UsWgrHQCMieSZU3FmZVMoC+B4AJ0poz65tX2vOAb+wkw0gTsGBwSShuXY2aj12V/cd7MMa/CD
	LPtjGcpkUDYrrL8JJ8zTrbFYLcHhTpO04aYIIsn6BR1HTp9Nu7xMw=
X-Received: by 2002:a05:6808:4d06:b0:572:86c8:6b4c with SMTP id 5614622812f47-57286c86d22mr4614870b6e.6.1794819604482;
        Mon, 16 Nov 2026 01:00:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 01:59:57 -0700
Subject: [PATCH net-next v6 1/3] docs: networking: correct the PHY
 statistics group name
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-1-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The ETHTOOL_STATS_PHY group is exported as phydev by stats_std_names[],
but the ethtool netlink documentation lists it as phy. Use the exported
name so the documented group matches the statistics string set returned
to userspace.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 Documentation/networking/ethtool-netlink.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index eba226c79ec3..8659761ebc69 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currently defined values are:
  ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30.3.2.1.*)
  ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*)
  ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
- ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not defined by IEEE
+ ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not defined by IEEE
  ====================== ======== ===============================================
 
 Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in the reply.

-- 
2.53.0

