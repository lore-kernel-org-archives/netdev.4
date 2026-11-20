Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146717;
	b=4HOWoAqCaE457mDYELgbiGfuYt+yt5uxZ7ivbmJ/XMKX2YbZ+CwqiEZRykb7pDx65HC5
	 vKzK92eUi6uFuORuEZ+qDXoX8kK8dRGWQN5Ic/Flk7MFH7EGYX7FJ3NWJFNugBit72Nqz
	 HkFbrLO8hTW3b45AhEKDPA7/FcJVsHGe+GA6gD7JuWAjC704GRwFKy/3GKXgbVG/zJIXF
	 wGnb3Izy/E5N/++77/HXmOdI+dS//XFBXxPl936CogHEl/8KmdBy1lOZhmoBc2AyYewNX
	 JHzoUN/2ain8pe0WgNPApyGjg8QTjodfc1ur5iHAZMU6vVfaOjit/tsqHkhHvb0T0PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
	b=MkTiTWMwQhetYJs8HZ3aiBo7rhQGPt2bNJfBqHUWQ2tA6V7Cd73+3wjsjCLrXR0JyW9g
	 k6t6l9xw8f4YbKQnAbp0OGBPNglAQbBfqVWVLkfMzXuHYD6z/hs6IaMlBVvmrK+dPxkbk
	 o5nk6vKJEXZ9NE1xCAt1R8bZg9w8zWQ2ykM6w3U6SRHI3dyQAP+mG34pAIyGQCzPPYUo2
	 bEGHSgr9sROQTLaw7r0EwyFCeNKV7yeCso91pbIHIZomfCEHZabd+BgCJ1/YCeAJ3E71r
	 Fu5yQ1vRmxDKYbbZ9Ch33VBE105PtwNU0v1gPLA6DvWByBS+mr4oR93lU/wlqEexRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqwhbhLr;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84C606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA84C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqwhbhLr
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso367276a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795146716; x=1795751516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
        b=oqwhbhLrke7wU3DhtxDtOl/nykjJS3bA4ZIbNYIXKgTaOVaisx7KuhslYsv2tWIOJZ
         AciepnPCV8zIU/GjpOY+AtgDTsqgocWlalI57xhxY9Jbx82VkrSEZO1csuxDdRiMv50i
         IPwCKdRELs54af3bTeIXADnubtxSBYqPKeFVLAj7KYhg0Zip9AtXkFuPSMq0HUtQ2Oud
         fn7x2U8ri37dOQNZU9CttSiuyeJfv2dGSMjoltWMhBdSWiIx5yUXkyJ7aOcykiW8OPoc
         d+sABrGXOa0K3Rg6H6ddzKZSbPKQDBEfoJBjFF77Tvq1SMTrdNEn+JpgKGcUE/+YlidV
         eH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146716; x=1795751516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
        b=xQ2W7acsxmN0je/47c2x5g8IdyZfP+XdUPcMSiGG52CheeZMRbDFoTwr9Z93WezVNS
         O62xQI9NzmVK/dBWfvcxJct6v/nJiwRfZd9W/gMGUjmdMeFb7QXuzaJMPpTGC+AYjBLx
         KJYTCWzQnL+F+QigeQTvLQZilziaO81Q2H3r6A2W1r5iuzPj70jxOugddtYouNmeX74i
         CpUz0IKhwwqMDlPAV30cC59y8fxmqK9J8TS9PIxa3nX7AiRezheZRlRoe2qHFLFvTQXF
         YBq05nKNwLSgPHCZ5nJqXf2ttlHvyoE6C9ugKjM0KrvSGn8YrAFhh8a0l9uLd3wF/Gl7
         s5tQ==
X-Forwarded-Encrypted: i=1; AL+hErERzKxFBrPMF2QdrhnPZWitbLh5KimUlw+yblNkh6oI6HxV29Flw1qkKIMVR/PCTs0DnTIBTI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JVASLhX6wlsB4D2PLJMtrNs1Cpnc+TpcLWkyhmnoTt7MMCo0l
	+i7IbWjEbL3oRQm6O40Xk1wHCvCZlnHvFPRMwa5P7gvsjP8gWoRzMI9U
X-Gm-Gg: AZFdTZdJAhisAQBygPwlVO0aqGRSZEEwMi4SDem7hNm3axNl43hRT8yXldol8JpWgjp
	KiS7Nddbe0ZAKcBNFJW/7l69xwQ7O5oLUjnIsH/o1piVcuF24f/Be3j0TQ04PEGa6T2EbGY03xT
	/CqeRIvy75Kq6BFfc5ila6rpGZzx06IuHCDMgsFkamodXUF2Psdujf8PEaZN8okwKhUSG3p+ssL
	SgRjETNIqXud9prSWMUFA3+Q0YHmCpbYMlso+UEX3QKEFj6A+YMBBWI9W2dscTD1BerIAtS1/gR
	VaQY7EJYnSedEMf4Qyd6pUg1OHyIF6lZHFO+8QoedYcoSUfolsK34uxVtUAC7FKuKR931zHDeJI
	BnNGH1jVVuDeoH3C0u/Y+wsRKNWC4AGYA4IpkNd+svHUGSvIkZ/oo5r8GAVLhCY722bmyJ4fT/K
	wmZN8yeiK9T4yYv3E4HIAobhcHJE73g/N3Lpd0iFb9Mt3eZaRx1CVap1nW2SjdpR8iASsae9jU9
	O03NTRP6jWAgzzDHmE5Rual1V8XJI0MHjbBQD5urdr3+IucI0PQ8/NRqlc5eIy5yxWcm9dNq0yA
	4xqeENmGocSpkwULUxkpykmXpo1Em2AcGKYCOJ0d5BlJk4h6CB34
X-Received: by 2002:a17:90b:3c11:b0:3b4:1336:4f6b with SMTP id 98e67ed59e1d1-3b41c905a49mr1415853a91.33.1795146716074;
        Thu, 19 Nov 2026 19:51:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm4638218a91.11.2026.11.19.19.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:51:55 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@kernel.org,
	hkallweit1@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	shaojijie@huawei.com,
	shenjian15@huawei.com,
	David Yang <mmyangfl@gmail.com>
Subject: Re: [PATCH] net: hisilicon: Remove orphan femac driver
Date: Fri, 20 Nov 2026 11:51:27 +0800
Message-ID: <20261120035127.1383109-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104145038.946918-1-robh@kernel.org>
References: <20261104145038.946918-1-robh@kernel.org>
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

Hi,

Sorry to see this, but please reconsider removing this driver. It is in
active use here and is about to get its first upstream SoC users.

Two HiSTB SoC families that we are bringing up on mainline use this
MAC as their Ethernet interface: Hi3798MV100 and Hi3798MV200H. Two fixes
from us, both found and verified on this hardware, were merged into the
net tree in the weeks just before this removal, so this is not dead code
on our side:

  444889dfa27b net: hisilicon: hisi_femac: Move setting of netops to
               fix crash
  d54b21d82430 net: hisilicon: hisi_femac: Stop the receiver before
               releasing the RX ring

Beyond femac, the HiSTB platform push is active on our side: a dmaengine
series for the Hi3798MV100 PL080 variant is under review (v2 [1]), and
more HiSTB platform work is in the pipeline.

We are also willing to maintain this driver going forward. If you would
rather not undo the removal, tell us the shape you prefer and we will do
that instead.

Thanks

[1] https://lore.kernel.org/r/20261106072602.77560-1-mmyangfl@gmail.com/
