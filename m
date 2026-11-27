Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795793204;
	b=2ML6ib/c891cT85OqOHYQ0J3FTPsz6LfrIrpqtOHM4iCF9Sjsg1k1qHkl0bJXUpeNbSM
	 R9pEe7Fe4i1LRLmoiBGpAKcDlbvM7rYrW3IUykoOO8nW1JeVMj9Eo8XKBtykT9PGRAM8L
	 IQ6E2oOP9nyZ8ti1ywxBWhAV50au7zGycnm1CxKZJMrDOBDSD2+0cDUwdTs/x/qoVcT6m
	 SPmt7SHt8DD5U3EENmIUKQLmaUB2bmftBolF0s73pH5yM7CmLptHi2jauhJf3HnyN6Fdn
	 wyXNy4R8Qwg+FiTbMPPzONjAMWQay0gz+kLP20pKxrAM1JL9MfGCDtEfXRGV1+5pckg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
	b=d2RYCmJru5KCgPuiPXgTUC/GmntMrG/HmDG4vkmt0A/NNi6ynWH8T3d9nrWqFw9MNPe+
	 EfyLpbJSS+6NwrFt+mAKur+nrVq04/+wjhFuuNjMRf/9Q5+435jdUiWYXEdSaDEJqXI9O
	 anqQfHeed4LvxtF+JIAKIk5tXzcqeLkfV4PEeUthDfZqwYc1UYK9qE1xmYt2HfV2nTEk4
	 LBRLM1RBh6GQYljU7pQn8km0IoP5W4ZHpcppv4rVNCeBBTZ8fJlkPrHbYAWv8eDz5mGZG
	 NKNNKQEeOMYnfF7CKX2Vlpvqyln0g+FQn0LYHOXR7sF7RweFiDtlGNFIxFUbIWO4fmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n94mAkyJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F744606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F744606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n94mAkyJ
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4e2fcc300so71766467b3.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795793203; cv=none;
        d=google.com; s=arc-20260327;
        b=C19WETxGjy93RFHcNSe1+Q3iptEXD9opEVS5SB7pW+3RpLF2+H60f4IfVKcUWQaj8G
         crD6HGAo+qlGfhse3s5mvcfy2VhAYPfFtROb8aO3Kbauf9sJTohhVaWyUVjZXaVQziq7
         JWXGwsdiKh3/P/s3VHba43+3iUS+eGh5jmVAKFiX6mQV/h8ll4bMDMwgN8VZlUZbMNIG
         EXyqu7zpowBDkFcwOj4EYcbCsp4A47BM8/uSxgRytxmxOOdq5WAdBX2DAHm4MfVS03n1
         mpmKppr27S4vBi0v3rM84ojJdA0NLOaZNEowomFbQce3RnOpcbQzXS1J1QnaqFdjdh2r
         opyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        fh=eUXH5mCd2dF2be1NMY94wfCQvHZTN0p0Wpqj1HxNeDk=;
        b=hrLA7n5u/1XzcAV9XX1WwB9wQzy0uWMZOFey0EZTJJP1PMtNXRhi3nAIEV1ntyKH51
         enBXUlwts62/1xC6SJ7ZGtJcQKEEZOrFf7ZrmmQ+WTg1SUbwQ3AYS8xm4rM3NImMmrg2
         JoaPzKA058eJ0t/qOPuc/b3NoyLE7QoC4e4qs7NGTr+NeUMDtARtJYLQais4Mrx+a7Jn
         g/Vc2b9sTp1918DjyZbkDKLZvoTt1Ri8wxNLpea8a9zSjDRb1ObE/5a5RTlz0njgyuV0
         AM69WL+RDo3P8sF53yaDioEhfnP/pQENCe0lEbp39VKF/bWfvAgt0T/4kxIGBDHJ+Bxm
         01QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795793203; x=1796398003; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=n94mAkyJOfvvvFdqyDtEpzjXrweT8JaZWeLZ+JYOiBFDDuYaMPknPGxHUMwIf2p4QI
         XbOKYuOKTdVMFxaHokKbNXTGDBUktL/B8JSyE7b6YdHb/W74KbvW6rbiCZmnIQlF/i8I
         ALou6ktP1I5Zbs41mBTFycRR8rPWR02G+g/k6UH6l6DD/aedUb053tQ5jkZ91GKvmJIw
         67G0iRK3SJp9Ne0ESx6cqkBNNWwucbSzu7o0e1KmDO5YpJZRB7LNyeyOHGcjxEYRPjwa
         qp45YwL1Q5w8yIJrLzHHQk7QAC0knp49PvcDTYRwISeZGMmOYrkYRgoOL+1gkc/Fe8L+
         ufMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793203; x=1796398003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=xt3vgJv7PChwWOQMaxWaIDPwnHkSIIHy/YUP54pEvapoKhXSxhrUYk50K7eSo3tGYR
         vXl2DPIbfhmc18K6ESg4RXua5/qj43s5+cMAflkplzSHK8MxI5z6r3pa5NuzuC+MtU+2
         mg4ucva5/oiV0QnS8qYEjqdk8nugh81Qu4f0kEVc2uEn7ZiImKyQYt6NP5+OBdq3tTee
         k1PVKRf5hBqT4GjTCRFWAX+y+k7zxbr9CJnjo6Qq0muUmO6AigEjoWotToKxcPiCOTLU
         8kKwl9oj0/KSRebhLxzruyMVvxug/eOUnLR2NkusXltpBcw8zdmeW+LCqAaBMslqdGFe
         Qj9g==
X-Gm-Message-State: APuU4Z8uK3HCQpbtLEmaU6kwH+7ujAx5wbwNKdY5diSiIrd8GNXqaltY
	0S+2GS2iBSJM2uybntXhPCzKz3xRlvHHPqqYen47NZ3D4pIHacj1Qms7SeflGb3CM8QpTwvNHa4
	hbtonzcmV/6643O4sDXWWOw4t2J603y5UBBxsUB7F
X-Gm-Gg: AZFdTZcRFYcqqp4U7rUZTIjYWtcRFOt5QYbOI6Rso47zXOcakczpBS1bdXa10okgKZY
	NjtabO/hUzZ6zA3hDOSUx3EV+05LdsR6FYpeNH2OmMml3rSRbi+lzhTO6C3w6qKX/5xWbjRQb6A
	7xV4+REsEegiF+ik8EgIeZJ2MgRX4TmlZc0rG21JDsDtsiaZfm/HToOEkk1+tDhD9xn/wTbrN/N
	ziCFezB9cY4KxXRBVEulZkTuTk541BC038aZ/6C6TC6EseR8Mtjg7xmjq+j3FWBQg5qORNkg6Eu
	ml83Hr14ut8wkE0p85tv/9mpLDMDtduD7Mr9CzMlTdcLO3BiSAGf68memwyS2g2c8UwgzTHa6wm
	pw5pnNs2ctXa3ySbSMHx+3/1UplWr+65rXX9wP1HXjuzXwSYUyfUPz1Wgtv+sElfEJlVaOm7QTE
	N7YsU2eDY9xkkCZ6Uj5FxGtSndOHWRM2mXhuu7CgYNJXpJRK9bSioDJRsuo4egGKt0317fa5xB3
	L6DLmf2BLK3cKhPr6J7Nq9c9pYr9qZMikEQ6lY0InOWyuuKCONIwsiibrf4n38/8VDmcb/RGIbR
	HPB+c+ihMVhE5W+7ZKdS7rfMnvGXgKkOWBthmZi0GHzE2Y0+zwvVPALzzFLrN7aqbRsP7Xt/vxF
	EQgCtXm4+M91ecA3WR2t6oBxSVfPZ28j+
X-Received: by 2002:a05:690c:698e:b0:8b3:45b:a4f3 with SMTP id
 00721157ae682-8b5204ed736mr106681927b3.83.1795793203488; Fri, 27 Nov 2026
 07:26:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795284858.git.julius@bairaktaris.de> <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
 <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
In-Reply-To: <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Fri, 27 Nov 2026 15:26:08 +0000
X-Gm-Features: Aa3M54pxMqgZ_s-9JbfNek_3dyGz87LXsEraMMuneoiDkKTrHn3sKg0m5hARvDM
Message-ID: <CAC1t37L_+P72w+gNcrdphB7xkBmCQp5PQRFpcu1zqM1m-2Am+A@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com, 
	kuniyu@google.com, steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	richardbgobert@gmail.com, ecree.xilinx@gmail.com, andy.moreton@amd.com, 
	alex.austin@amd.com, linux-net-drivers@amd.com, saeedm@nvidia.com, 
	tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, 
	linux-rdma@vger.kernel.org, alexei.starovoitov@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ack.

Thanks for looking into this!

Julius
