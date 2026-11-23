Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417657;
	b=JLy0ibsanWwtuO9s9NKdOgKU8tvkyWp9DdsVYyO8U7pmON1Wn3k4+7tY4DIjS0d86mMm
	 /ohnGqhmYVsUmB1mkOC0MvSQ8mmrx7kddXiMjjOnYX+eJvU2r7AepV+NALu3JveTH8af5
	 ekvshxcwFgMsL2MN3+vaib5N0Je+ZXJvVloYJgSanajqf4N/ra0avgvCR4eSs+LI/Ol3L
	 9ULRNlEiywZ+sPNOSibBtcuIatuLzQ0yNdCSC6xY1l1vg9Ob8WCgQsG49/C2oEtOIS0rA
	 ZOkV72hOK2KOQcol9bBrAMMHgvohFpisZTmQhb+FNBQn+2qQl37NwHyuHPvb/AeWsEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
	b=lHh+cHsbc7yyUxP0BAIQB8zjws+Xoa7pd8Jle+EIH23N4ZzRlFNeVehmxYImKXCQUvBx
	 x9VKvNVFrMOhpibWcdZob34EZxMvHXoDgUsKQAuIUw2KhLqV226ryYk3/ZleRz4Gdt473
	 SF27qJuiXVl7g59egzdMz/rwJWfw4u0jnnJAtp/3LzGSGN8jcf79lwR5VxHj4cGJiKxPV
	 V93fFhHpCvl58X3oi83JL7F/wUmdeUe1bs4qz+ZZM6vT1U4wbklXhQhe5Uuk+qaj2XxmF
	 VUOYNi20/w1+x3yjDdIjTTSEDvDsscRDvmfXS8Iq6RlcXSxQxbjdJibCy8Ebc0ZiQYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U+lWctsR;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCF6606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CCF6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U+lWctsR
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b930598cf0so5143347b3a.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795417657; x=1796022457; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
        b=U+lWctsRGzRFPIowLeFXgiiB6l4PafdP0ufQnLQM460wToUfWjkYeAmQgpG/S76Dff
         hF4P4QUg39kTO2662erx1wIxq1ld2FBQcb7PTTzaSxgaAK6ZhGxEAtwOwG3Cr54uGUpR
         po2M6XPV6Jr9wL9YBgYZhNuhAXt47Uyg6TR8b3BpULTyrf3H15vDbkhc0nMoBzkP/fac
         dpoHwMlbWi6wHi5jJvj5WxXHdcbIlkWQR1UDaFWl6eKEjxqqBqPbjnqX2vVWpyFGyA3v
         xKKrisqHYyAXaBI3qcAqlIxnAKdWdGIhDwE4/AlcXYFIdm5SnZcuIanTpwrfJFwOO5Ea
         18bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417657; x=1796022457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
        b=ro14pAMKL8RAmfIKYc/8QTg4i/1Ej+o6DSxHdydR8y+9pZFa3a/m5OmTdcf80PbOkB
         sHFLvwawBAJ1bO9ZCORzP+o3dJHdYaHFkd3ESDZ5yHvUAUxIZrr+wZbmfbaLD2jr93n8
         hG/SfGqfAqYAFuIgbUOj8/pZXuYf+A2Boss5i+IGn2Tvmr6T+LErX9l3Wjb4CU5n8dkP
         0utEasg4P1m4CVQiWzpAreES88wnIxYEmoInoxKdaig1n8HFXTpRako4OM9XQlSPwQna
         9wX5qkYJ/NN4vWMdpncH2y7kZnp0Ex82+bxfPtItEAXJaYeq73D5i31BmsyjpWjP9EZD
         6aiA==
X-Forwarded-Encrypted: i=1; AL+hErHvxy3A9CfW2Lv1lITLfI7mPRbaGyJLGbGGabVCN6sFjxXbaiH6fJ4MdgcF5SXw99nJcAkDeDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P/8KJvShL3Ce/9psGU+AUD0yVGVgmROWw49nhWXFATFWiJG7I
	p3dGSWOcoVpE9nT4U3vtnU7UL+L4fYGKbcvYi35L2xkfBa/t+nyuz4BFM8iqUXQ15cKjG7yuEHE
	ZDpdekGNpcSUMQQXO+w==
X-Received: from pfgu2.prod.google.com ([2002:a05:6a00:982:b0:89f:afc:76b5])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:984:b0:8bf:e028:7864 with SMTP id d2e1a72fcca58-8c87663e154mr10249455b3a.0.1795417656556;
 Sun, 22 Nov 2026 23:07:36 -0800 (PST)
Date: Mon, 23 Nov 2026 07:07:34 +0000
In-Reply-To: <179541590924.3294.14959742776383569350@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123063608.3665186-1-starchang@google.com> <179541590924.3294.14959742776383569350@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123070734.3686009-1-starchang@google.com>
Subject: Re: [PATCH net v6] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: netdev-bot+sinfo@kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, 
	Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wangroger@google.com, 
	starchang@google.com
Content-Type: text/plain; charset="UTF-8"

Hi,

How it was found: internal security review of Wi-Fi "Hole-196"
mitigations, which found that drop_unicast_in_l2_multicast does not
cover ARP.

Triggered: yes, reproduced in a lab setup on a WPA2-PSK network.
Another station injected a group-addressed ARP reply (sip = gateway,
sha = attacker MAC), and after the locktime the victim's gateway
neighbour entry was changed to the attacker MAC (seen with "ip neigh").
There are no kernel messages or crashes, only the wrong neighbour
entry. The broadcast request variant (sip = gateway, tip = other host)
was pointed out by Julian during review; it goes through the same
neigh_event_ns() path.

Best regards,
Star
