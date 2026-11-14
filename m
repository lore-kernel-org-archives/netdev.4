Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681624;
	b=cVPEHYCHyJ3cn2Cr/urDwYdm3FHy7V5opmAql1eSrFEx084PvxrnkW8qDRmevEqFBX2/
	 UqYcbI/UJe8Rj6JYvfCz94S6CNB+sG8kAdEJ4rdqLWNtK40deqBOMGtZdcQMlCb+bRzaR
	 jFS9BKYGb6+WiQ6MRrLo1AtGr8PiLM7kyKcCTyihp5H532od28uhQvEU6Ya0SEdrgV1zY
	 yVkwPCaIgnNTw+FRNIVbOAAzauCheVdLTPV8LWyD6yaTc3X8v9h62HOjoSlIMtxTV0QrP
	 5d9LAqBAnxeAMGvUyqHVwutAzyBLnrFsBg2hAJaY1u+ad06fWPhaX6YffC3mLTimFwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
	b=zqS967sGF51JlDlAQEmC5XKSQc5c3UV2sxVIcwfDQjWvm4c2f55b2uHsOnQkcB/7ouyI
	 eas6fSmS76Vby/tZdJrsxBjbZ+ZUjMJCcEQ2xP3s1dlKqVkviPnRsInlo0fFhWWjt4Mx+
	 ld5Rtndi9vFvBjf40chameA1vkqWscCoA4pEjXDwqTlluh0o+GKRx5EQO+uPTBIJjtcrp
	 e/DaN4UlPHrt1yogQZ7kj6mmIwbnLyiv5jYPYV3x20UXemZez7CKQeUvDH0oJ/Nwz1YQW
	 kFQPllfZWR2QTLnD12b8ySMkz1IG3/j7P7jHwpSyDqxUqtBBSew+OSbAAkQj/s5sh5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKQvH0XB;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914B9606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKQvH0XB
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1015365b3a.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681623; x=1795286423; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
        b=OKQvH0XBu++VojD/u+INoAqGc3Ax0Cm7sYdvZeGr3L8gqCisEOw5EBV3aKep+umVWn
         an/nnKbxKy6DYbjRYvgu/fZ2SPbcgI9KPEl1Trd1mckq3R53F/E6Eaq3wvQbeeuu9l0M
         0r3nMj/ruEGEiipnr4mvv1s9NXN36nHgwxKsBDsYSprDn+XISlJ2s9UsbYlL1fZ36+YW
         A/Qnm1iUNoYEqgY3KOs/GSb9tQtZyGLrV2AnfoR1Y7B/pv/QjEJyAnpnTilMgTc+fpPP
         l+S5oKVA1wky3qlKOje4o9/IM6XIqLEcmeKmB1OmFo+lhyEmEARsV93Mfdv+LzfBQJk1
         QToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681623; x=1795286423;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
        b=zyy3ybxDeyxmF8CIvNjq8J6T7kG1Eb8UiS6HShC4XH8xCTx4myUW7ac0iD/9hMVY0J
         VOfTGc+5Jp/fk+ODaPCcqY1G9ADiovhloiRII9o2UkgZ/IMFo/5aq3XwiQuey4vqYbFU
         cFKxpvo5wcf5R/WigXO9NjjMmWXf1CYktTL9vWMHxFy6NHGqVv2+RAUSjD4eLdgPUv6O
         pkS0MxD4IXaJ4gRwGaO86zQEJT6naNBfhNYIYCz4LwW0qPPDY2NJceeCtIsxylYm5xgo
         UlQ3uO/2wpqP/mOKzutZfCsxm7euVcAjPqiE8o0SLGJUpyE8z0BacANHf0Z0dUUbmePC
         ekaw==
X-Forwarded-Encrypted: i=1; AL+hErHxgF/yApgepzLeOECoX7mMRQ+pp73BfKchTiWk/UwaUpzeD6jXcWBO1rzRPAY3IggOSlXw9ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z89ulCiuSjHfHJuTxlSwgGDdlgVGZPc9gO0WAvDDAtg7NYpppfB
	EhHSCbFZWn9iyaYRZ8bj7IOHmn8FqYcP4MLR17L39tOnOjSL+CSTRJA/
X-Gm-Gg: AYBFou2KF+NsdG0r1um8Sud5VlAnzC93/r9E0DBnopcPfGOpsXiHexK/Ip7rW08/8zz
	hwfHtxvIXMbsIsf72B7KmMEpNbYRgxTtqvjVLtkCHwa49og3w1Wv9zr4JHPSyc9Rl7hkWOaeXSq
	eMbULCSLhJ/rnbggr0HiK8XqQuuvS54G5JkK6YcdJtcYCTdQnKE8kevFHEl3P09bORCXd/xI/qO
	8YBVR5Hh29ELwHF1FTTI6u7MCMGKQ5GOduzf3angsEOdz1EJhTt8kmazpy/TR73mNJsv/V3JxbX
	thgQxQs4Ozf338dDmQLVdjYbQR2Qf+3AJjSv1QQ1USO1v2VBbuWvybK/9rTXPeRMyGiq1+Km9ed
	lx6N/+xT/3WJH3WA/Ydw9zn/ioAX08kukJT9PNMKx6Yu1hmVl4dMccPga2r7YjrKWr3n9CrfMvG
	PtTCJ+1gNIDPpnKads+Af6e7jHiHhdzzeSicQWZm94JxRi01zMD4ZYkBwspnC6m+Nox1JX+Kvbb
	2r2ONZlMOH/FWgux62FrcHtkR9KRYjf0pmwGUOIj6WZvTiTdWdJIA8G9mmES6IZxm2bp2nw89Ri
	N1ntgNA8XVQsL0kgSsNyAsKiFn+VEEfLD1GPc3RU+4ZP4nkfkUc0fWKyqoyQfYKyfn2vWmlV1QU
	KZqKjJ/20yzH4WdQZjYL7O6raLMC1jV5lT/s=
X-Received: by 2002:a05:6a00:2346:b0:89f:ed3b:df97 with SMTP id d2e1a72fcca58-8beb7150117mr5498543b3a.51.1794681622656;
        Sat, 14 Nov 2026 10:40:22 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263649esm2256214b3a.45.2026.11.14.10.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:40:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:40:20 +0000
Message-Id: <DMV5JEF4P0Z8.3K0HQK7SWX2S@gmail.com>
Cc: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <andrew+netdev@lunn.ch>,
 <dsahern@kernel.org>, <idosch@nvidia.com>, <ncardwell@google.com>,
 <kuniyu@google.com>, <richardbgobert@gmail.com>, <willemb@google.com>,
 <ecree.xilinx@gmail.com>, <linux-net-drivers@amd.com>, <saeedm@nvidia.com>,
 <tariqt@nvidia.com>, <mbloch@nvidia.com>, <leon@kernel.org>,
 <linux-rdma@vger.kernel.org>, <daniel@iogearbox.net>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <martin.lau@linux.dev>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>, <corbet@lwn.net>,
 <rdunlap@infradead.org>, <skhan@linuxfoundation.org>, <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the
 header they describe
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Julius Bairaktaris" <julius@bairaktaris.de>, <netdev@vger.kernel.org>
In-Reply-To: <cover.1794139176.git.julius@bairaktaris.de>
References: <cover.1794139176.git.julius@bairaktaris.de>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 14, 2026 at 10:27 AM Julius Bairaktaris <julius@bairaktaris.de> wrote:
> Patch 1 lets SKB_GSO_TCP_FIXEDID describe the innermost header again and
> replaces the inner flag with SKB_GSO_TCP_FIXEDID_OUTER, as Alexei
> suggested in review of v1. Patch 2 adds a selftest.

Thx. lgtm.
