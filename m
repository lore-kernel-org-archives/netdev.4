Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202227;
	b=y0NYyHCsAWTjZRdj+UVih5Erd+NKIlNOKQhWDEnRhBl3SYnCFuTLhnBK1yl+ytlu1WFp
	 OqO4pW7S3BpldCxAkuw6E0xVWJf8ZFSX8et7MjS1J3B/BKMe/u9l7HNYiLYIhCR/F3w7a
	 Cdnkc/CZMclT1cxjE9R5Oh52O+Ag6FOIrumUNP4rFET8yPXUuxXOqJvmWsrwyDE8upsYg
	 baAnowty3BrXAD/jOrJRMPs6mK9nQJ8s5z+jvszcdSp3WR2MggEr87aE7jEQ38hETHwBe
	 T0NR5869hkoT/KwRJzcUx69Zo5+glsGjkr9gNQIFbxFhn3YN8qzRH3saPMU2Q+WUUfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=5Iu/1w/LI0buVkR+aQF4itDAWB9ZbTOtkysWfOEOOGc=;
	b=bWAhK0Xb9NhkMCu+CLmyoYzdAO6PdFK57QsFu1sDm6czqXt5eqWG1DcLCQC1Nh15u89j
	 X3kmzE92jYKe0TgvCW0YK3YPYWV3S/yWQOVgO1/aNpN/viuCVvtpvmeV/ayeCRS2y2TSo
	 2ireHdrY1EwbuqXzOWCavpkD4mOwlgrh+7hx1GbU+yiWem4awJSQJb8tKzdegESEBB7tL
	 YEM2Yczu4nDD/6wt70MlXUKw31JirifkwjwY5h/Waw6Q5UtIGs13B29e+gDXCMkDd5wuY
	 niNoYf2OI2geqIrwnNrsV4KqAhG1LIihkv8WX6ZS20d6vvu20bQS1HxiM/64ZUVrGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iS9DAKA2;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B060A2615
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70B060A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iS9DAKA2
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so617137a12.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202226; x=1795807026; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Iu/1w/LI0buVkR+aQF4itDAWB9ZbTOtkysWfOEOOGc=;
        b=iS9DAKA22pBrxKuaIMLvTBi3iP0uQzx9apoMFxnN1ajW8P1+uthtNgOeaMPpmuD7Fs
         4J84WBU/iCFUgsev5fiozE98dq4NS2hBbxw8ZBvyZU51Wf9mXanbCWU6ithZeDf8+5I6
         YefDGoWR/7fY3S/iffZ0gMGgjxlxF/grERWv+SnZCv2YyLeo8ku61kvpzh8b3doetX6S
         YPTcn3EHvY60a2wx70MWemRecyb03Hm+u6mnEEofzgRqCkRGsmTops4t/PelBfJQPVoB
         8pJ9FJ2J9gs/IiguQ9+pg2kByfRVxedtVZr97u6dDgFPV393Vy6+24EHoYVs8L8g+4BC
         7OJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202226; x=1795807026;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Iu/1w/LI0buVkR+aQF4itDAWB9ZbTOtkysWfOEOOGc=;
        b=HTMWM04ozpBcIIeVxKBxNVke2StJReldTY2TlwCuT5Pd2Hm4CzqXfrqKhsjw5AaHiH
         06BsZ5FRbVg8k13OKuS5gWzd93wdQB6PL0rp8z7N168udAVPxo1a4Iz/bc5cW9lS4i34
         6tolxCXlU1pBou00uVY/+a4BMpIqruCchIgHIzB5fe6f1YgnFvwhPya+HzM//8wPtV7g
         wO1wLcWLortglJSqtU6MPuuJGBfgO0S/sys/wzZQnDi31gF9/D506HbU6+aidZGUuhUF
         3swLNwAjnZOdIARTevJ5AOk3IRhXdJR4ZgA6L+YEBPKeJo/j6Pq2WdvwQud9CDuuyQSe
         aV4A==
X-Forwarded-Encrypted: i=1; AL+hErFbbFiv4vGj8d+12AK0ZS09w5qxHsdKoF8t0wfEURbZB0RxPl1Vd0Bmvwkv/ELyJ/wRThXUXFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KrODGdk3BcL/+RUY+1ecyFSIoRoJe9f7/ZTNF5ECPHYiwgLLv
	iAT1XUIrq661eYWSL9hCvOYnXIwJoiBigwuEJvIhJmg74XqRBxrxAv0Q
X-Gm-Gg: AZFdTZdSaNMK3N3djv7FAX8Imr//H7JR9rfEHBmjIDbvt44CxDVtG7q7fxhq2gcyPC7
	qDT7+gvSYMIa7msZQMtduR02SkgWPbtdiXPLgn+GbJVbSg/tSg9VfbLQRJFY1VFHfAIQrvnu3Ty
	tD9EaDIt27CAQSp4qt9Q1Ikj3fsH8xgWKKLPs6dv0Ku11n6Q+hqsT4UFoTYK0JnVej/Fc5Minek
	JQgeoLGd5Rdl/FD3/XY8LuTTRVsStSDTWBdIfh754nblW7PN08+QCi1ns3KTiWImVMCejynilEU
	U9xoqgVv0G0LWpFRskwQijfsuE0dH48FYFBbhuvVQvyKRKOU/oFKNQVDBQgfC8Uj6s204HXIvUU
	07IS91LsdJSocWRS3mq7CzWgyjavj9dC4V0g7ezwY64nxsbaM1CmuFKT4b4KPwg2SnF1azAe+tH
	pxSVLp9Nq4DbI3UNQE1wM6aq98ylFMcoihxmQhnbl4jqiu5lZMvoN5xj3HqPMXhnSJ+pB82W+2r
	cw158D0LPeqMQuJKIigcjoB8rFXQ5H36NduNV84DhetU/cz6hI5lY9Y1pobTFeLh9pLCUnIsyrH
	nAOv4r2u4DFRN7Glek2bZWCJ/W/kGNgR33c58D0KLZ5dAKue+KJ+j05CqWk9buSDcVTgNzuyTNL
	LYj8fpOQz9KeGihC0o+X2jO3qjmUarYIOlA==
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr3128974a91.58.1795202225858;
        Fri, 20 Nov 2026 11:17:05 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm8535782a91.10.2026.11.20.11.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:17:05 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:17:04 +0000
Message-Id: <DN0A2SUOYS26.1M5IXC6G41RLL@gmail.com>
To: "Nikolay Aleksandrov" <razor@blackwall.org>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Joe Stringer" <joe@wand.net.nz>, "Paul
 Chaignon" <paul@isovalent.com>, "Alasdair McWilliam"
 <alasdair.mcwilliam@isovalent.com>, <netdev@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/8] bpf: add bpf_sk_assign support on egress
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261119142231.2612515-1-razor@blackwall.org>
References: <20261119142231.2612515-1-razor@blackwall.org>
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

On Thu, Nov 19, 2026 at 06:22 AM Nikolay Aleksandrov <razor@blackwall.org> wrote:
>  .../selftests/bpf/prog_tests/assign_reuse.c   | 625 +++++++++++++++++-
>  .../bpf/prog_tests/sk_assign_netkit.c         | 586 ++++++++++++++++
>  .../selftests/bpf/progs/sk_assign_lifetime.c  | 182 +++++
>  .../selftests/bpf/progs/sk_assign_netkit.c    | 153 +++++
>  .../selftests/bpf/progs/test_assign_reuse.c   | 174 ++++-

1700 lines of selftests. Pls dont.
Tell your bot to make it absolutely minimal.

pw-bot: cr
