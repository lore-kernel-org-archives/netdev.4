Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032946;
	b=HnvEWEf5tg6Gzu16/9QQEL/bsFp/1EWHyweIZLMavjtOTMolkyvfLW3qb+S5bcovPk3R
	 h/eZFUt0KL7I+i9ewomktqE2ZLIaryJxXL7NRzEQxFuBcjKNWvNlzOsEsKlXQFGPagbCL
	 RXFExi16zdtzT/wnFYhzMskJx6k25cnRGNopYOmuI7WlWnvrupW3afLfPPraaGUsJEkam
	 gdGglYJrRhe80q+V3hyYFskAI56mbTAJ9bb709ceLwT7PcvztXQSCnZEIvSmmeLqvvs9N
	 SSGGe96C71vag+jtde797GiJqoDiz+EX8mvucnYEWyBNtiLNc4jJc9E7/3hY8qwJAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=alE3qKWc8NVAdXHhS7gzmUz2VtKJvT/F5tzY0t38/Ok=;
	b=UDqILgmvsROJsccWVWPD6kJt5Y4rNPhGM7I40Mv6+HAI9OD9WBVkIrFwcB4FXmWUUPpL
	 Lat6l5yIyHZjEUyTEcgprfprJiBXMUOGLeliJMahVjCeuLBBfaahdrNeM70L67y2QmbyT
	 t8bJiPv4pKTIot8yXurmH7D1Y6trhSviyKO6ZZ+RrjrGjBXYI/y+JsEmVUyF7kxBcN8ea
	 GWtnlxmwq7vsoRZ8KrruTk4Ewiz2mR08HRBmcdWphsUttOGa6IRkyLHat2djXE3wWohNB
	 eB0/rgfJEKllniIv43DWtQMQIT0L/7Qj0c/qCVna4E+6vVhLoIn8KC4auJwiW9KaA4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j6ZLz9gc;
	arc=none smtp.remote-ip=209.85.221.199
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECB8606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECB8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j6ZLz9gc
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ee30bf935eso387471e0c.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795032945; x=1795637745; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alE3qKWc8NVAdXHhS7gzmUz2VtKJvT/F5tzY0t38/Ok=;
        b=j6ZLz9gcnoh/yCLGPw27IZQHM1iLGDhjgvjd4iKPziOV+l4XFss7jDz8l+hyNtAtMq
         GfaCWT27iBVt4qJOL3c9Nug3ryKOYKFTNZTRCotBsUh3qB2RXNCg+2Xjltth0ovj7WpA
         Wmra0gSUnqHGG0rGR1i+NwKCIQQrFOnco2u+bhxtnbdhCk+WwiXkuaym6TanSHA/NTVX
         MbxFDHRcxCmo9g3pji96KYGMuquJj/BEJFjYSaSW90ZsEnMNqg9GQuKU5MUiJ7H4kone
         9cmk/CwQTgv00udvQVaKJn1pfX6FtKcTxLdn9aC5cMaieM739MZn5UTu7P6Vrj4Zp9oE
         173g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032945; x=1795637745;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alE3qKWc8NVAdXHhS7gzmUz2VtKJvT/F5tzY0t38/Ok=;
        b=durUmgeWnE7RoA+av3muXhM5IVQ0eIa7LQTkXhzOo+bL5PEVlFpHC/+THcIfS22927
         poqo/uCJPSkJqsxnetHJgC7JDTuk4/EZgCShNycMv37KFgspFBNIgNRiJvBDdr0Gzvbm
         ZpEoV9K5/7X27je6gkxuFnd31R3fjAJyL34xrmh+GUC7aG2f6tALW3IsXUdo4ugnVltS
         FphQxOrkYbUq/s49NPsjKpJyuCT3fwNTN6ZNEvnRlrzabKQtmVmXJxrwgED8u8NsOb51
         YpaXAqpoiaKpYoRD/pkw1ku9MuRnBb/PbA1M1ISYK1wLfLaqxEihqsJGJD1hvVNcpdY/
         Ppyw==
X-Forwarded-Encrypted: i=1; AL+hErGJDUKH0Z/IY5lxENPkljwvZDvYXMw8f0tSL4ylDCjF3iCEFm0j8gWvfLfgnTufBziPTNZcXIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TAqp46VR3+LMCdgVKY3Pl58CvR1u/rHtwVAxCdY9xARiv0pQt
	7ajrtOVuS3NioG74KtCy16neR72z3+lp8vGZk0+ItfMTzj6k0U2QjKRAMyliB7sLTa54snyP+Vq
	0uDl6oXlxRz76OISm13/bpej4HQ==
X-Received: from vkbed14.prod.google.com ([2002:a05:6122:470e:b0:5ee:363f:e720])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:208d:b0:5ce:76cf:fb2e with SMTP id 71dfb90a1353d-5ee6470544amr1998275e0c.16.1795032944886;
 Wed, 18 Nov 2026 12:15:44 -0800 (PST)
Date: Wed, 18 Nov 2026 20:15:40 +0000
In-Reply-To: <CAL4Wiir50_Z+m00GyU9BpRdAqgXs8V-L0S8kmmES=JiYyt==gg@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116023709.132684-1-thaisonphan@google.com>
 <20261116023709.132684-3-thaisonphan@google.com> <CAL4Wiir50_Z+m00GyU9BpRdAqgXs8V-L0S8kmmES=JiYyt==gg@mail.gmail.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261118201540.2446821-1-thaisonphan@google.com>
Subject: Re: [PATCH net v2 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Thaison Phan <thaisonphan@google.com>, Matthieu Baerts <matttbe@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 10:30:58AM +0100, Eric Dumazet wrote:
> Sashiko has a point about the BPF custom syncookie case.
>
> Requests coming from cookie_bpf_check() also reach this line, but the
> kernel did not send that SYN-ACK, a TC/XDP program did. The listener's
> tos/tclass says nothing about the ECN codepoint the program used, and
> struct bpf_tcp_req_attrs has no way to report it.
[...]
> Could you send a v3 doing something like this (untested)?
>
> In cookie_tcp_reqsk_init():
>
>         treq->saw_accecn_opt = TCP_ACCECN_OPT_NOT_SEEN;
>         treq->accecn_fail_mode = 0;
>         treq->syn_ect_rcv = 0;
>         treq->syn_ect_snt = 0;
>
> In cookie_v4_check():
>
>         /* SYN-ACK was not sent by the kernel if req->syncookie is set. */
>         if (!req->syncookie)
>                 treq->syn_ect_snt = READ_ONCE(inet_sk(sk)->tos) & INET_ECN_MASK;
>
> And the same in cookie_v6_check() with np->tclass.
>
> Letting the BPF program report the codepoint it used (a new field in
> struct bpf_tcp_req_attrs) would be net-next material.
>
> The other Sashiko remark (AccECN option carried by the third ACK is not
> processed in the syncookie path, unlike tcp_check_req()) looks correct,
> but this is not something added by this patch. It can be handled
> separately, no need to grow this series.
>
> Please mention the BPF case in the changelog. You can keep the
> Reviewed-by tags on both patches.

Makes sense, thanks for catching that and suggesting the fix. Since v3 [1]
already went out yesterday for Chia-Yu's changelog clarification, I'll fold
the !req->syncookie check, restore treq->syn_ect_snt = 0, and note the BPF
custom syncookie behavior in v4.

I think the Sashiko remark on the (AccEcn Option carried by the third ACK) is
correct as well, but I agree we can fix that in a separate patch set as it
isn't directly related to uninitialized fields.

[1] https://lore.kernel.org/netdev/20261117124710.1338951-1-thaisonphan@google.com/
