Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202651;
	b=5qnq+RzK6xY2wnaFNPezIBbFY/tUeWEvtCL8SASSNrU75JrsfoIbYOILM9tdNRH3XGhC
	 m1tR8KRYCnMrTILXjgjPBMA9HQI5V0yGdsHoHpKix2bXWg4AJ2aG1/3RM9rzk+m3lYXkF
	 lCvxKrCxyos0NmUqhgFzMHZj2nJ9MODkhMJmqMXgL1vs3eZiQlSFGdZfngfE7Ws5D4Env
	 +r4lsbTV9t4FmUC+/TLXIY/pqbOyyYeSrQxUQc34k6SKZkDSbWtMewVzN2mlmG6H74dpp
	 BJ+RoOG1ssv8NarRv/dkOugbE3xtNbd0t6pe4HiQHyroV1OJQg2HWIaIqVLUCunXNeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qHo6CdyCabm8XH8aUppzEr5dak8Hjpei/j+QDqjBmtE=;
	b=dd+eL8kVKog6onCjOhONvhEtXVelWCopEa+/C0VpYZhCXSiiwLm+JtzZ5VtHe5R0T5e5
	 GACff50mN564JHr590BlTPWPfDpcflEj2NVbmllkmvpCDMb0lOdgxPcN6O3qbHjYSNEXd
	 qFmerZOHlnDPdXw31TrhYRmoJtstdZ4yggoEZpDczyl91M2guSXBW8NE9MUR15B4TSqDE
	 h85oQec57sHogyOhSENwS9gadNdSqeGFtAAe3FOPcY8RB9idzCHT0cA2i5t9HVAKEKe98
	 1vQfILqQ1esiIW1zZiMYw733KbbyaQhT5wrNK+DO9pJ5HNoMWZiK/RODBXglVQqvM3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=MWX3rqdu;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89648606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89648606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=MWX3rqdu
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a358881793so700878f8f.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795202649; x=1795807449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHo6CdyCabm8XH8aUppzEr5dak8Hjpei/j+QDqjBmtE=;
        b=MWX3rqdub2/YZr8awmCv4sB0tcy8MHCXgd/nQ9Qka8sg9rdMObkifriYyu/68Pf7T9
         9NHP7i1U/6cGX3M7BxhI8rAnPJ213jGK186ZTspzL0EL97GSkkd5uhNeMn/jo71E0MC+
         opCDBFvJ5Ovww+WSm018f804RJubnFFJAUTrJgGhxsg/s/QMtaB13mYZx6Hbr2QAdZJL
         Bi1DC4t1adzP6EGUm1Z5b5fRWMylX8yBQcU+a0A5BhAHfNkyetgqiDBBr/mo1BzyznAa
         2qJUkjU4xpeCnetqQ9wNT45LJhhlgmjfPfxYZtHEa/tCnC82kEK9aKKGyu6vAa2TNZ2a
         etTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202649; x=1795807449;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHo6CdyCabm8XH8aUppzEr5dak8Hjpei/j+QDqjBmtE=;
        b=Ok3+MycXRfRiLq/VPJA+J1j/oKRrgdX5Nsb3PRVPcFluTid6UDOtChTl7dqf6dyHZ9
         Qrz3wAser/aGbqGtk7DWUBDc4VSeNADKcAa0GgwGEk7ZkzJ0xnltCoJMvvm0BLOAyNIf
         068W/CvGlo8xcvNTUWX2FgT183d+E7ND8a7P0auabTCcioKplWkDUgm72TEMIfGE90r0
         DgIqhGSQvv47wk5GIeJPLsFFQvAASgjEEYbkkyrcGmPfwPcfBWZqGWDdLpPzZHrn+7Kz
         PQUE2IN+bTODPeVwyFw8RevVMHjBdxsnEk+CY4j2A25M4wjDmflLHR3RLh6KzyXZMBhC
         tO2A==
X-Forwarded-Encrypted: i=1; AL+hErE7WElSeCZ9Net2jKO8R3T2JnT4QkcxWWK5wLFWQsUV3FUWBhmFZ54lyjnr9vQQurPvJCMmVzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yoZyfqcCrL6oEj8X1HVrNAKw7vX1Y2+t0DW56b6TdpyXrtAgZ
	JsFQpgAyyy/pRlS+3BnuhYzBqdPcHuIb04rD6lcVoZupNrqB5Wnf3lmfV1h8UtP/3rsZgx1MjOY
	DWdZZUp7Ku9sN
X-Gm-Gg: AYBFou1S+LufUVmCzg3x3H4Fk7EOImrHBwEyT1/LMET6tVQ5TXbhlqNTibYkKmc1Ig3
	a46qomWOo3VnCMU631BTbPDIB2ndJMm2pTq22usIbni3ZHbtIhpzi3PIasuhaZmiC9/2S8tx3Id
	7OnYG6X/zOj1KlLe3vyH7YPlz+klQoQjbc3xwG0n1Unx7NKbuYiRO9cj8HBXATQjz/1Ol1S6p+Q
	JWWfbhKVcNLwpnzyfYBolc9B0EyYA2mBhnB2epwZdNP0JPU+P/HkKF7kbSO+t2QK+l97yFU/tK9
	2rJmxZfpg9xGc+t28xPsiyzKu+bLS6WmJ9MO9SWBGTwNCRtfRQsIr6la5qsQ51WTdIPMwjhjN0K
	cE+bG6TFgPUf6umbcHB34muAkk/BLwqx6mcy41424i5jVeKxpjkd8s7oioDeNsfaHH7HBrkloSk
	h/wwBxrPTnRkvbrKoq9TpApomqJ3JxQ7nmxSAL70/yTrLapHiSZTjo+FDrINnm+V9+lmHth6cy2
	dMjc/JETDZM1hYnOwfM4N6dah9z/TYANx1UMm+K8C89JimZn3V/SmK5DS9duZK5d7B56pcS6yJv
	PteNvmdtY6z6o20vCFgDb7tmP9ik9V/0QN8NeDCL41BmbcR9iqVjLu5pMZo=
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr91151435e9.25.1795202648785;
        Fri, 20 Nov 2026 11:24:08 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm36376085e9.2.2026.11.20.11.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:24:08 -0800 (PST)
Message-ID: <27bfa146-0512-4e35-9e68-fbc8c50ef405@blackwall.org>
Date: Fri, 20 Nov 2026 21:24:06 +0200
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 0/8] bpf: add bpf_sk_assign support on egress
Content-Language: en-US, bg
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Joe Stringer <joe@wand.net.nz>,
 Paul Chaignon <paul@isovalent.com>,
 Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>, netdev@vger.kernel.org
References: <20261119142231.2612515-1-razor@blackwall.org>
 <DN0A2SUOYS26.1M5IXC6G41RLL@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <DN0A2SUOYS26.1M5IXC6G41RLL@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 21:17, Alexei Starovoitov wrote:
> On Thu, Nov 19, 2026 at 06:22 AM Nikolay Aleksandrov <razor@blackwall.org> wrote:
>>   .../selftests/bpf/prog_tests/assign_reuse.c   | 625 +++++++++++++++++-
>>   .../bpf/prog_tests/sk_assign_netkit.c         | 586 ++++++++++++++++
>>   .../selftests/bpf/progs/sk_assign_lifetime.c  | 182 +++++
>>   .../selftests/bpf/progs/sk_assign_netkit.c    | 153 +++++
>>   .../selftests/bpf/progs/test_assign_reuse.c   | 174 ++++-
> 
> 1700 lines of selftests. Pls dont.
> Tell your bot to make it absolutely minimal.
> 
> pw-bot: cr

Yep, sure I fealt nervous about that, even though I've reviewed it.
v2 takes a simpler and more narrow approach anyway, so tests are fewer
but I'll try to keep them as concise as possible

Cheers,
  Nik

