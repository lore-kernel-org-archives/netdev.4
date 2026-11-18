Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794967236;
	b=D4FSUi4I3Xn6zdVuufQwqiuV4BElhDJZcDPJ+bJaJTXokRItmp5IVEh7u1zvqc1QKN5O
	 Cfl4eO7bnuRY1sMsGdbdJhJi0zmsrAPuiwt+Nd8dScLwISrTSjjP5lRUVrgcJo4nFNlRX
	 eaCI/ihld9E1nJiP9lBs+oj09ctQVjVts7LJYaWrlqBHMgOwbsV4h1x7pZveTHd6HESvM
	 aTH7RyAraTUTM2lGpBSCT6T7omGRnWgd9rVJnWGZyM4DSGM+6zHalDfRNcXWfrePpTfOD
	 +vG4XTLz05cKhngV506+/CsnF4EnZevp6t20qGt8NVamPqq9jNc4T6IHqNe3fIbiDpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7DtEa1fPKxHzyQrbe/ja7llzwuQl0kRoXKt8GgAzaxU=;
	b=fG2Kx0j+96i1rYjjUIDvuyN3XoIhmynOwpq+oGA4SCZbjwF/13B75dNLLh/zayxcqAmf
	 rAm6267ZqCXA27diQ/O/4Dy1czTzocmLeg/mvEP2JyXMoJx9Atjk60Q03vqEICUvKGYu4
	 oy6j2f/YKFU6PLfSkIcboHO/MeXE6f3HDRSvyW1j1Us+xy+ids7xZgCdvEGyiINvf+isn
	 KN3EMEPVSuT+3QS+3YoWLf+Aos7RzueqeJ3qpnWFN/sZZXHn6EP1PbpGNL0XaWAAe4jKk
	 XUe+bjcpxn1WFbAybxKDwmCPAYQaiscXJZVIxPlRC2Kkz+q2pibaJeRUCv7sS9h3CLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQZegpSj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7975606A333
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7975606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQZegpSj
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso48015066b.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794967234; cv=none;
        d=google.com; s=arc-20260327;
        b=gWRelqF0k3i0qVFvCzS+EcyXqnaYRzWeFW3/L2MfC2YaqfPp/pwvwhLAblkLG/jtiA
         TxayEaHOaukT2ukKJQ8rOde7snWKLSvN+eNHG9XAUJI87//wk6K0VfXcsDdBxkrhWpVm
         Uo0hcRCXkOZog1/btiqL6HL5hWXs9imnlKyM2XNmhoWrhK1eSlIGDjJjLxlIP9Z1kPzU
         tK8Ek6FeqKTvJ42d1j6za5GPC8WL77lClK1kWB4p9DCCHWA0B3f99PQ3jA6xwVQ0iopA
         tifvPns6p9rUHNfPUYQ7pysofllsxAC7LrxV6J2+NG7UuuGtJQWAtOw8yodbKcdgIGbB
         Or5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7DtEa1fPKxHzyQrbe/ja7llzwuQl0kRoXKt8GgAzaxU=;
        fh=3XI++voCA6srOGPu0+ZRAZn9iG6JE+FzQja+6VTTlyA=;
        b=VMdEnPARq1v6vNc16hnAd6qMY0FabduxJeBxAC7pf7w2hxU02oFP5zIAREp5Zcx2k6
         xYlG3OI3kCCcjdMPqxOGGDydLzxJk6Hs1QkpyIm8sWAiQ1xgVcHPEjWVwQLbB6MvoefJ
         kaiA5LehXD4Gl3uPw/V0AVyaKu4bT+8Ye+4fnCwa1YRgtbbL/uTdyUcBS6FExKlkczDz
         TdteoNqcn4TDhtg7yWbTE+MH+Me37J3Ui7ioi1CAoh4Bog1d+HFw9NlsJjR59uHQ9DQS
         T5nt0h1ehL9l1CtBTweIM3M8nn84ddJ/XGnPUF82A8SAMFBnsoV0L5FzvlpwvMayVHJZ
         9T0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967234; x=1795572034; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DtEa1fPKxHzyQrbe/ja7llzwuQl0kRoXKt8GgAzaxU=;
        b=TQZegpSjnt5D45doVsAcAUEEw3Rvakc1nMSw3HK4scuyu2gv+oIsn45/nYdeI2uIB/
         kSVPAJIGr045+O2Q33xA0h+cOsHwJerJhnwE7ErhX0AWCSOjvxwD3sKT27FC/4XwNFzR
         fi3bbTaBFkUB95dsQHB7HjJ3SP1/ORdmI/z8AE69/4m5gnIaD13s70IPCF3qxOqxg/2q
         WjMeDzqN8LSquE2JStqEt2QLKHGFPDG2M11yZ4qUwU6KAthfh1nrl2eC0s0DeDCRvw1n
         ucJtzqjlTt1q0MDnns9tM3EDGsHriN190pHwUm7QH4cy484L0bPd2HevAJwfmy/QJVO7
         e6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967234; x=1795572034;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7DtEa1fPKxHzyQrbe/ja7llzwuQl0kRoXKt8GgAzaxU=;
        b=yR5R8xLqrCGAQ/pR9u6mR7BEillNYiaD9eHd+rTDORJml7GLm/hG3NPM5tmTwGPbOn
         lIHIkFRT8fZ8aKxY9fAmmOFooPphSjGSlpyOhtdHL/mV1Wiuh+4VtuX53g21CO13enQa
         rejpqjIMV/trptRUqzMfaP7JXflO+RfOQ3/OuUrFhz37p1/OfbNh7VwXh1u697IJEP09
         XehX4ZJlszvWPpr28qI+ACM3INJS911B1M22cij1OL9fwLQKoh6j+MBz23xVK21C+qXo
         T74KOaYKpDAbufjPCN1Z8cxgSW+m4AsOHlQmWHt51Qztm1kMOAjnaS/mWiT3VZRDakm9
         2lSg==
X-Forwarded-Encrypted: i=1; AL+hErH/Tnu2C55B8bFitJitySLoXsNTDkZr9fDaDxoiKXmqzG4MXdEdhYtTsP0QkT5o8SE7uiL0LQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OUK7KMlpOiq90w9sva4tgL1IKQK9SYCykth8R+EUtRqaVLxFs
	qQn4J62Eq97IWR7lCIF3AmDS1AkD5+aMF/8BxWnKKddyZ9d3GGyl9Bl07XhmIKI2l+6+95b0cNP
	/FNmhrC8Yroe4/CGEx+NJ2QTGI5+aH7c=
X-Gm-Gg: AYBFou24pxbJ1XBOQxQGjPMu9e1e3xBpDOEh833XdQ5d1sFbnI0mKR1UT+6lJMysHHk
	JwYnF7vXGbQMvuKy+J/fZ98VwT48EpQy0Zg+xDaRIX836L8B/LPDR0GkNWTH/9NTgQYnHIj01dv
	41SCgDiX4NPZTDQWMnWY5dBLOFagm13vjuC4foh0WAbt9Y3v3O4X476E3g1m+6GIWJkSYM9X4sD
	AK8i+tD9BJZM4O5dtSODbvS9XIBrn0QC15Tb7BPc1fI/d+0pm5NKt9miM/6Pbn4yAmv1W2lm0UC
	FPAXNE2O1NO0USQqu8XTBEYbfhmwvh6IsvNxlvyX8EWM91uG9RUszg4RhQdXTVwjCNC4VYN2Xxn
	ZVlz7gCLjGuIxBCHAPO6T8p2rE5lEqMkj7xo9zIV3JXmblAQnV1tfB2XDlcHKDI12KqTLDUCW
X-Received: by 2002:a17:907:3e12:b0:c4d:4ce5:7733 with SMTP id
 a640c23a62f3a-c510e1f2a23mr79732666b.30.1794967234088; Tue, 17 Nov 2026
 18:00:34 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com> <62c7fce5-0296-4e66-92c9-fdb501ef592a@yahoo.com>
In-Reply-To: <62c7fce5-0296-4e66-92c9-fdb501ef592a@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Tue, 17 Nov 2026 23:00:21 -0300
X-Gm-Features: AclHuK8VdWRcutya0Cw9hPH7PsgGSrdsC1cePFqvcBvKqqX-zjhNDzrEEgsZTJQ
Message-ID: <CAK+kzgzcugSW_Qo_2=qyCFY3C-bjELp=7nbsDigvh67Pk-J1gA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 09/13] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Tested on a TP-Link EX511 v2 (RTL8367S-VB): PVID registers at setup,
PVID set and clear on access ports, untagged frames dropped without a
PVID and taken in with one, priority-tagged frames taken into the PVID,
and a PVID change in a VLAN-unaware bridge with no effect on traffic.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
