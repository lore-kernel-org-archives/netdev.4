Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683337;
	b=THje5dsvZ1T5qKHf3IxdqiB5ffR3lNkgmi5QyXd+WSqvZlJxJ/QPNtWF6SkRLMRzHySd
	 QX+d3M+Y96VSuGs2iuk4CGyaCbRlmkY0uJzJqkxpW8zJTlcRy6f1XTg+fF0kfEgMREODJ
	 VZ2b3CGdp9IFsPZ4zT4iVyDWVM3zgXi76U4vulHD9E0ve652m7khpWZ/o+RVOSMb9ueS2
	 rzvT+xJa5FIYuPvEwiVefcmSvvhdAafKHWqFub0UGa1jkKyoDCCkthz3GxiKA0u/H8qt8
	 QrWnNsCq50tsKzSacdIkWnB0S1sA3JnFg9GYQq59SfMjMdc55SqI8qUWIasxq6A8C7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
	b=zC5JvWlbHaXzszKBzkD63V2p+vb/DwzhVG6KxFYijWXei2jcubB2Sdi/JAq4uaSqW9NJ
	 fOmKZ5XwxvbfbpzGgaxcXZrgEx2YsWuaLUvNqT64BXkTdnx+25sbM/ao4jIqkvJXi/B/m
	 EUMDk8korT3WhKxwf9AMzdSxrKqFeojgf3carjG1rffDQbywheVNWjaqsrYJCr4EvF3VZ
	 BD8bz0zixw8tsMytWvElKas+DlL5eUKXJHFWd98q/721P4Cif35nZZA12kocReQgZEtbx
	 EQGyPojy0OYdMwd5wvhSlglvXbPsq4utsx9+ZwSUKNEpKcjvCLAQjanrllCQWUGeafg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfMg87DP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C1606A685
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D02C1606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfMg87DP
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c00c727a21so563740e87.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683335; cv=none;
        d=google.com; s=arc-20260327;
        b=A+5SBL0cH9BozFa0Q1DSNfhrC/o6SNrFWX52rPhFZCw3sv8SCFzbksbFvBkkKbwwEe
         FAU7ZBzsI9TDY6KuU16pW71Nr+CQw8jmsdTYQ/jKF0a9BKQTHXHPRl12U/aGQimc8YUF
         DBt0bxFkjjU4dFp8NagomW1guUzVkhWN2kYJKksRz0Nk9bczTHurbR+NOI1lVYWpZgHG
         sGlWiX8A8qcItV7OdiaEl9MUN17YyRX+pC8fEoO2u4G2IOkgx7EAZazrVROCewsRMQ0d
         sQFyO5JLyC6svNS3vQJ78gVE957ifxxxBdsk0WQZm1j8buIzeORW1EIIhpjWsEuf/lSi
         BQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        fh=T8YhJ6TpIFXkkeJhY4v3Pwp9ZBfqqH6x4ZnXju7DrBQ=;
        b=reDmNbiKzxOeVNQHI9JPvnQlmICatClqmvrSG8kUPMKHLYxhoWkd8QbznV1iiDkVA1
         wbu7nRpPqsYW/oDjapaJzr5k4+C4cbDcTb+XegmZBGtCbO3FVa+sJV15g8pRpX9GAYmg
         vuIdHO6znLKcJFivW4I5x1InLbxh2MpJjOcAqKCSdMya6i+6ZwIlEEWSO1lttow9jD5K
         5k0AfE1lN5CumBrBMLS0SzGchrd/PjSlf9akrsdrdV4Lbgfz+VxV0IJFOXPPBRpvamVh
         1qxdUp+VkUul3kozNJjUK6gV9EdYvJTv5gVgZFTS+Pemo/UuZnsiQlihbxhr2GH+jzs2
         rFVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683335; x=1796288135; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        b=rfMg87DPvIeaAt7WefjGyrL7uSD0uquLqmcawwAuuF0LDc6gm3phN9FgQ1hfcvNK4P
         vZUlpOYWEPZRvkrmo+Mh5OCC14KnFgEHDnbHYBX4t18bjdh2rj5ugU6P0+GkO8jWovOn
         RMvM770R8L//+znfMXxpcv0SQZZi9vdNe75S8ImFMsKJ3Q1QjbmRT2JJOl8FScurQcSB
         0tqg3bunvtmzuZ2dkoxsxh5Ib9cTPnZ3eF/Om7ll6kPxuzPcCWzJbprFtufbqrH4s7/U
         t9YQ1tkr9xcfscV4PTDAcngJBXvdMP87j158ZHdpSixSopf2JQM3kDHgOT41E84eKBAk
         k6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683335; x=1796288135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        b=pO9MvjToPWFMpn6u82hzLzMViBdNW5Tn3wNF8VpK21Lsv/2MsD0qNKpNvSIzcyQYxw
         buBxT2GR47h5sCP5n6EK+iMycLo+Rih/W8BpgPuE2VZRXZ98snUtjHA69pkxE+smZhnK
         ooxPqctg+MtaJec5esmQEsBQJNH1oXLNZyIlWdr4dVOMAgePmdaHSsE0cFyPW+GnRy97
         qesjD3o5DJF8ibQtSRZjUK46mekJZffuLBgBLBslVOzb5gv1cpRmgYSL/tBt9qvig9Xm
         XDjgw8FlKxj7QjaUXqH/YtPV1vt+txVS3E37b0L35vXIr3Vx+NFZCwm9n6XmAqoYcM6y
         4JPg==
X-Forwarded-Encrypted: i=1; AL+hErHQZ4CGUXJ8uDB7z5pzAMuDe6zudPoXoflKMnav6c3wzSuMkDxKgHXsjLS8E3v3+ZdOwSaCmVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ej8u+qCk2Dp6frVnN9/FIvl6uiWVtE1SPNhks5NAwcHib2PGd
	nNgVeqahRodq62+WFxFmSGR4VsCTj6KfwXEkeGD27du52TTIu5eQIi3wMrpnL4EIdsznQUTkYzl
	a2McFOriz3sPmg466i5YPbmR4tiboLww=
X-Gm-Gg: AZFdTZf+45XrWwfHpfXeovO0fcOto2cy8gHMQ4TCg6p+Bu9/ZGSFIk8KdPAZn3XRnvz
	Lr7FPiUKcMOr0fYCp53oTxVVo8ukWSho4EccBH8i2SnV61sl2hRdov51Ga/oLZpAwYbznOwgpS6
	PaXx2eP67M2jG9dxz+ThaSgjsbKG7U/vUkIK83ncaE+QXb9RGpFfLs2Sj300FJWZeNKG56Id3+K
	x1sZLcJmHVp96cVSU8yU8ynB4FF2KDRVHDJfds0aS8qM/tUYn9Ta2lfl3gc7Uo8af3RDiClvONl
	MIcUR6IKdT45djV0lcjmJ39ynsce4i5jHNwQmuzzywDjkga9Vy4jpZq/d7O26+I0574Erbo1MLv
	+RjNSOtX4/ip2pmIt+zHQxAOFbDLcal0DMTqWcu116izZfHyQMF3vM3B4i346vYEv8xX31Ws=
X-Received: by 2002:a05:6512:1151:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c1bc7ceb5fmr8223250e87.5.1795683334857; Thu, 26 Nov 2026
 00:55:34 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-1-231196049a3b@gmail.com> <20261123-quirky-scallop-of-beauty-c662b7@quoll>
In-Reply-To: <20261123-quirky-scallop-of-beauty-c662b7@quoll>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 26 Nov 2026 00:55:22 -0800
X-Gm-Features: Aa3M54pFlibDAmDC24529Pztyl31CflHnU5Me60OGDKTLA2a_3s21NJ2pQ1ALv8
Message-ID: <CAEy9hNX-TiThoXZ9+Q7j=bB7PpNBr7Wjz8_sH7C081HXka4xHA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: net: rockchip-dwmac: Allow iommus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-ide@vger.kernel.org, Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Sorry, I missed the report. v2 allows iommus only on the RK3588
compatibles and drops the nested ifs in 3/9. It follows once the
arm-smmu-v3 clocks/resets binding it needs is settled.
