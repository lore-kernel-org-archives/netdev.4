Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795856504;
	b=Z9cccjMcjiVQ5p3HG8BxaG5et9hVVP82o0gfNCf5JynLef9lQ8hgVHzr40Hzup/VRuIc
	 WEVJhBFCV+hX7ZvI8BJbuWFagTYeDmDUcwqbjnNfw+pD0oFmGup+QFrmSvfZBKlddtjus
	 2sM3oAcEbTKjkLGFY/5oRJC/S0Qpco3AizLZUk/7g6wKDHHFQiBQV5mqWROT+Q8aZ8PPG
	 /2sVOzWZYuTVZ37imy7yfw5rJvCcY/ms0k0NjyGeNeZl+tayy2C2irV5IWOix0CVGu3EN
	 HWf0NwxEQKUltuJwQwTufXkvP7gOkpULLxdKJ5wWUqz+jbFFsz4FjbuUPCOs066Sm9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZlMrjGV2cB9dtnpaJb3k2imX6Vg5jC9PAc9nUTKaf4Q=;
	b=sl3CHIW3i5FgzihNlM+X7kh2ObW4NSfNV318M35SkbUCLbdjnPm/ePeAiV7TjbKd2KVp
	 4P9YQgelFFu1zJriiTxl3e4mrG/6Q9S14XlK961YH4PMgQsogfdPIfSyy3OtF7UwII4fU
	 +LEqXd064pQjCr6JeX6Dhuy+68OlmwoA2VUmhR7WRspxwIm8zVeSjtFV1CrcEi89QlMpt
	 I9ekbVBETfL7i+L4uQhu2sM1B1nuvpwlp7v6GCrc6xaYc/U2AMIjQ/XsCd7aZZFYSwOAA
	 SpfxwdHvvhqGLJsAe+Joi0ei4NG7JddTydU2jOozDmpB2cEVpay177SEJiQwEr0BxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYjWjX9l;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC68606A31F
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 09:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC68606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYjWjX9l
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so7494223eec.0
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856503; x=1796461303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlMrjGV2cB9dtnpaJb3k2imX6Vg5jC9PAc9nUTKaf4Q=;
        b=yYjWjX9lEL8IXw874ZKQhHDVmBZH3F7V+I/pFpKR3juNLHyhvT2MgMqqibF45J14/V
         ODOW7D1hnsk3WwrUWmUxxi9rMhJa6oSbaQpsGSgEiXD+iFrvKG0u3sj6vhII/DodJ3Mu
         SkLA3MAeeAanldxzWohh9XKRvI43mAVKdBjcnwzlaTeccc0Q4prJLFKr/iV2/9w0QQmH
         2flvxVVpx8Gm1pEwGNFl9WLUN/Tefp4SBFV9Q6fRWotvqs4dCihby1GW/4OpRYj/GROX
         uEFbbTLgENLMCpFoa32rStrTLzinVlae/MrY/8Z7wlcRHrj4Wj3VUTRDlH2BE1QRSQGF
         xrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856503; x=1796461303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlMrjGV2cB9dtnpaJb3k2imX6Vg5jC9PAc9nUTKaf4Q=;
        b=bgfZqdqqQ7ZiEvE9MgbASZcNkOH1+QA0/c/v1xXGOHGUzoJRopOPx98yz6crwjI2s7
         b+3fZXa7loXwM4pBZhamyYzEJNtInMzbBLAu4qTZORRnRcF0xKuytuCebFlKU8gpNfh9
         8vQ9WZESB47NCHC/wQK5dop5eZg+nVR0yFIUutVAHtGsGhq1pgKGdVxaKzgZ9XWva7du
         HnOj5AGOrgOMTC1ELsmqoF80yCHL0xBTxlFeh21iacpWPxmqCVTUPY0jKyPvQdu+jxig
         VrtPcwM09KssBwcix0bCKhbB9ZzJ3LNoCYnT9QSn3e1ubI79IAFPsqc20lAkXlPsmjsA
         ZH3A==
X-Gm-Message-State: APuU4Z/+aeHZ2JwtqOJ/2O8GJZeEmh0D/9z/rLu5Ml3CuL28jXGLNyNm
	COmnspBvHJY+YQCoIL45R+r8y05kEwrLVETOR99b1rKLmyB31KjGT+/+
X-Gm-Gg: AZFdTZfzR7z2ie1eKg4iHQ93623tKJb5bmIFRnUj2yhhfKPLS0bkLO0lybFXt6skR2h
	XILJgmxwY8o1s7GrbtwB9/CkXHR7mu3h4IEOG2/HN6OzN26n0eJgS6Fpdp8RincTe3Awi/auV6c
	Dj1RAsZijenfYWTuac4U2Lo0j+KmlJgsg37mfcrdsNTanBPNAlk7BES/Hu+GODgj6ei4cBp7EgY
	MwtgxWfEgLvcgePYdu8ooICy0RxnPOuC2vuLJbPe037gXS2rA5nJSdxOBt+q+fJO+c8KyQHWaOt
	4gfW/hCgXSjFZzZppw3rMA2MjdsJrRSmm+IABLjKUbbPHRP2q57HWAmh+VB8+FSP4qhcC2gWqRW
	QIw7hgLNxKUChsj62GSo94PCVSeB9tfqobPfRTmouqrFL//GuGQAnQT1Kui/um86Mrv3LwKzfAz
	RlC9yl6e96r0cNZshfRAL0oIefPd5Witop+QjkPsSgJVxmBd5nkcWsVMcIK1Z652Iu1J/HBno6l
	ynqB9WcuYt8f/GUi4x71xptSa9vgTdx71pjFlpv2SqtVCnre7Hj/se4lSn5AJFJX7PRMjEckzmp
	6ZKZoshQAjRmOicZcDAU9wl2LHSWJHcZLV1utfZJw/rRe8alhtJmC3tLVrgQflLqKwe8qbIG+SU
	vtTaxjBY2fFmD1sHNJSxYO5lppSJhKx0Or17gj4nU+7V5hBo=
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr28833654c88.25.1795856503433;
        Sat, 28 Nov 2026 01:01:43 -0800 (PST)
Received: from knomputer.. ([2401:4900:8f55:f867:c07b:846:4da2:5ea0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm103079223c88.9.2026.11.28.01.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:01:42 -0800 (PST)
From: Anant Garg <anantxgarg@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Anant Garg <anantxgarg@gmail.com>
Subject: Re: [PATCH net] net/tls: publish offload state inside device_offload_lock
Date: Sat, 28 Nov 2026 14:28:56 +0530
Message-ID: <20261128085856.96525-1-anantxgarg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179585540508.3294.6988362720637393202@kernel.org>
References: <179585540508.3294.6988362720637393202@kernel.org>
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

This issue was discovered during an LLM-assisted code audit and
verified by manual code inspection against net/tls/ and mlx5.

As noted in the commit message, the patch was compile-tested (W=1,
CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y, CONFIG_TLS_DEVICE=y/n) and
checked with tools/testing/selftests/net/tls (965/965 passed in
QEMU/KVM), while the hardware tlsdev_ops + NETDEV_DOWN race itself is
verified by code inspection only due to lack of physical NIC hardware.

Thanks,
Anant
