Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014426;
	b=GbwhyT7bgvgEx3C4Kg9BgL44j0rdes0htHl9Ww8iLPPJDRzfnyzXEIAWDzWzps+HRVuA
	 Kr5dCBMSZ+mNmiV+eJe7UWjzMfivjl26VIMjKaXXPjUJT0E8GBg3U+kqoqpCc/xR/SndK
	 9DdBUVBNxKOHCdng75AqLjAJJMMPSNz9Xjxp6uuz+CT2WSzcAkO5dmw8TG3v99n761n6d
	 UbKKxXnOSQUCyY9/vCpnTyRRBwN8khRSDSsFPC3HyR9AavtsWlkTtcg7cM4YgLqIQmZcX
	 WL8odTDO26yoB7DZb7tfzZDYc/QZhhTdgb97fryPkD+3etvES0z33eJGJTF9ZVa14dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pR/71leRclppdiKz4jHL3lSdBSxZdODSzE0Gszdvba0=;
	b=RBa7W7uRbSO5aeAUss7r0K+gRuwwXy0DMeh6g6JvYiXRG/j7BVJHnLZ6OikFFT0v093V
	 yOJPxFWA3bcmsCahUWZAZ5qUG69Ov97JZ7EW9l7tRx/XKYQa+vwGDw+N1zcXt2M+76JOQ
	 5GI4znw34OUaexxN16Jxc86MHv90soNCDc9wGUxFz+5jkNVy7ZcToXpEJQUSZS78eDvjk
	 lYNe9KMdkGom+JdbzNJY1gUW1pKOaNQrm5uq9KAhYOPwj+83VY9n3cNIKtJZsyY5hgABC
	 cuRnUYMIpB6FEZ5Nxm90V1J7ny1zDVaYIKrhkaaM8p0zFzcmebCqWDTOYOG7NmfF1Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Epb5T6PF;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFCC606A338
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFCC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Epb5T6PF
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso912974e87.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014424; x=1795619224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR/71leRclppdiKz4jHL3lSdBSxZdODSzE0Gszdvba0=;
        b=Epb5T6PFMTlK/EhcgOtGNjWPgzywH2BllGiGaV99kgokQYPlDRc8B+qm5Kl0SgUbKO
         y2qQMMcPIMRZk0yn8KDM+aQNmMyjlV8mhK7iT8AFGD14SLulrt2NQFgFHnRE91Br0MGD
         9f9up6y+tsM8CUugh9NARQrsR3Cdk3MrIXahzqPxDPX3Jgf9I3VcwAtcb89i/uAxXfGo
         IBvoivqkJskVxUPWB6x6navflEb+ZnmSg/rnysg7wvH5uP6Zi+txQo6aEHe8R1bqcOdX
         851e4FGMFLiF9d9mtCCT1SCL1wwlEoZ7XQzXdZnMSJUOCXagb09XJt6Kz2VUkZp6uwXO
         zztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014424; x=1795619224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pR/71leRclppdiKz4jHL3lSdBSxZdODSzE0Gszdvba0=;
        b=o0b1uNACQAfialX+OT1P1PFGsknGOwiv1NFmUannc5XLKdVfp0nWcNtQ+kQqTo6/vv
         DGp00q5p83foGtc4ffmfQIvl2xo9Gyj7uhibm2l+0CYcV6lnrdvjR8JHrx/bve57dcGj
         QgUajYcvGXptAkTb2ksj3EegJCT1b4rMIFQB4ODK8GysikhFV/qACh1/FdcXuNVHVxPt
         Z2EolSaW1x7wEsxr4aqRhMjWtSoTQGUT2l102ZpAehv1/TLN2E1Mk+38p4tdAL5aNhGL
         h/XeCJjXsk+KQ3hG6au+Zj35x1H81Pdsy1cD6zjdO+sM/mXZ3Gmr7lHNkn1MWCRQHdd3
         XhEA==
X-Forwarded-Encrypted: i=1; AL+hErFZYEeukCujLyvIOq2sMG+NSkIW4TJwZjsbf5IROXpygrAiv+3Ptk3vZ1LVdfBz5yu68/iBSj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X1b1mW4OHupkaFdeYWzV0s1mE/WEnjPsSszfbMn7JHDKaRM6A
	fAmiSaI/0DPKKukJcd9eacrGv2torxp2zyd4Lh/mLK922F3ogkKn7SdG
X-Gm-Gg: AYBFou1JuyJj3X/7DTaV7rxfOJudP6o1oMKOd+yfDwHbmmt73AdbhXw5RTV4YV4jIp8
	A1LqXpGFwDuyhEVdJ7oTwDK4GYFCig9jTjTKLRHvv7aMIXhrm1CTplW1+8/OuwK6+yp8r62fn8j
	eDU2IkA3H5vtxYyOP5fwO61n5Dw2bQU5d2sVHhUuvy7D+lsu8lNThCsXm5Ng6vgdmikY8pLjgXB
	n+VlauOw7EnL68RLiD5SDLxrp/g52/Hgj0tg9qS3VsTo7KVEz2CQOhfjKdRsPlRMde35dj07O+E
	B3scWSLpXOFETviT0CVO/ZUy95SKt412j39qbUoXJAgznP7JfvBPcipUCDyosc5FMN5xJm6al2r
	YqzwiGg/AyX5ndLz/IM+PNkG5ijLt0MahTod5vCeitmULeMmighqoOMiqV9kbVkzLJi2lw8Uu91
	6Exhpe422mbB74EYtluagpqej4gpBgKBQKNMU9n6qdkFRrac/Z4aCBCzm9dRitnNPjsYUlbMkoh
	bTkpav6aUw/gPtmIndVgSalTmZ4WgsSZrOSutnrKGZhj57DE70Nc15Gt0kryYCTSPemSSbrZ3D/
	pwMgm7b1TrIrCANP6yHbxlt3DJyF0Dg5gRD8zk94tPtGVNzedz5aqTBMrwT+tpx1Jutr5CCbq5s
	Mpo92qrs=
X-Received: by 2002:a05:6512:b92:b0:5c1:4cd4:8bcf with SMTP id 2adb3069b0e04-5c1a9f19db6mr1045054e87.45.1795014423455;
        Wed, 18 Nov 2026 07:07:03 -0800 (PST)
Received: from DESKTOP-93012OO.tail8ac4f7.ts.net ([83.245.241.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1acfd9f68sm366210e87.73.2026.11.18.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:07:03 -0800 (PST)
From: Elias Pukari <elias.pukari@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Elias Pukari <elias.pukari@gmail.com>,
	netdev@vger.kernel.org,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phy: et1011c: don't write an error code to the config register
Date: Wed, 18 Nov 2026 17:05:30 +0200
Message-ID: <20261118150530.16472-1-elias.pukari@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179485554872.3136.2853572906945647083@kernel.org>
References: <20261115180735.649299-1-elias.pukari@gmail.com> <179485554872.3136.2853572906945647083@kernel.org>
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

On v2, an injected MDIO read error put the PHY in PHY_ERROR, and a
restart at the same speed skipped the configuration write. I'll send v3
to cache the speed only after configuration succeeds.

pw-bot: cr
