Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032996;
	b=woRSmv9h55g22olqDpN/vl7Z59phsdVk0IqebQjMIOItky/KWkdOwXsylA2JUe4N9HF+
	 2UcJVuvhg3rUS2ir+vY2CxL4Ix44IwKfaiPZbQlCj6uPSOzR4yan8piiBDTT1Bw8QZLV5
	 CmxeXJ5uUfZvXtjLbU0pvhYlIXnsjgxmWslCfNg4xYkpJ9fUN54KVy9Qv/io/0RcV+205
	 tyj/37zg6DSJyVEu1PKdQDhOuPtlYeka8K41N1WNVVJVTPPYbmt6AgyTUZzS+5ooNaXil
	 RdjfvG4HNAEumlyGhEbfXtz6YoSM3GG0arukrSqHIPHRY+F+qY3bmOOwee5Kcvcj0Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
	b=Bx4kBzvlE0JkQ1U9d6DnJKT5sh73w/+IdxXQO/L3nS0Pr4AEbaoBsULhHQS61agUFios
	 cP7RKYh5kEnkVXAOCMXJanFu3Sc7+xeO/BJSwvXD+jy5LFVtaax5AWwjTtMWQxX+lNgBI
	 S5jEgvfINdhrE/XP1CgeLfFd1BVbEU9Sy9doc5Vdlmy/VWsLJaJ5+KJpWWYc5dQHYqgNq
	 y9q0XXWc/xOjfDohzi8kyOmdAChWp3tnAoOef0G3iANxrWThOXl7R3n7DNQRY6nGeWSU7
	 mmmlRepzRYUFk098lTKm44qKdRewJTLqyxWVY5fYk9garEnCP0Pq2AzSXB9rqGbnKEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y9OAzbGm;
	arc=none smtp.remote-ip=209.85.222.72
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16839606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16839606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y9OAzbGm
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99be6943b20so1003196241.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795032995; x=1795637795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
        b=Y9OAzbGm6kYJALJzjtZ05ZvviapuwbRA2eVXG9xEOzdMK987x+7hSsEHqwQVuCIutS
         e556beZWHU5xfLOYt3j8Ne0HwFTB4Afoz5gzgrmwd02Kh+evM7nRzJUNETZKD+54eZvQ
         krEGNSgdZBzxmXN5YmF24HT1azeHV6CAu+tcyEQwBjTYtPkfewUoVJZ+O8mpIc2V2AWw
         /JMyBBvxrA/v20EVokYkXHQ5JU0CphOLaul7I4AF16m9jvMrTYV8a48BcA+4Uzjy3Q3x
         o9g9kuf2KIM/1n8QiY1Rdzrt84dwJkxs/hcum5A26XOjIjnRdlXlw6MnHzcdxwIpCPnj
         xzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032995; x=1795637795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BbG6Ibh3KVMcdt0G6qbp+g1C+02LBnBwZSTdZVSGeQ=;
        b=bwryN6jsxH03C3dCBR1n8C97dl2ayKVqlyHF1ym6aAIQiD9S0iH5sCRNjQo/8+eDaq
         7lrKHD9F4c2MYFryGtFS4ffNJcO5lNSDjGhq5ZCAFXLOt8sxoRegxXnA/Q9EF2X3rDO1
         y9wQhW1za+0US+vtBppjwhMXac0PvMMhzjlmJ88HgPKU60zzf7fYBt9DEY0fXpz5IDR4
         UfCYYHCoDYu0E+yTzAph4Hnth6yYP/fnLA03hQktoO4hxLEE4ysQeJDhHdcqFmux2q9N
         hvde3tgD5206H/PQoW7WpMHA7MTaPg+cGv/lrKhL6Z2m0IeU+gtgvOiub7ElzivjSRxA
         GiVg==
X-Forwarded-Encrypted: i=1; AL+hErG17B31dleJ/kDTvtitV2Pm67VkEOwfN2Ud1CwLUhZTr1gnWv1h3TtRKIyHzb6NkJuRJKHAbrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PvWfIi0IAtZYpRwjTIbtdiCHinlSYYRgNuouoQ/37RpExR9Fa
	2mviaHDCQ2/eUFtVOu5cafmx1hRuanj2XBBzr5Oeyoh92Ncy31jxP0dtP2wFX5nTN1qKWx01A8F
	kT7h4sRIVRhos7NLQ//U+n625+g==
X-Received: from vsbbd17.prod.google.com ([2002:a05:6102:1571:b0:7c3:3c65:bb6d])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:149d:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d6ba4ca641mr1483449137.30.1795032994710;
 Wed, 18 Nov 2026 12:16:34 -0800 (PST)
Date: Wed, 18 Nov 2026 20:16:32 +0000
In-Reply-To: <sashiko-outbox-220941@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117124710.1338951-1-thaisonphan@google.com>
 <20261117124710.1338951-3-thaisonphan@google.com> <sashiko-outbox-220941@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261118201632.2447530-1-thaisonphan@google.com>
Subject: Re: [PATCH net v3 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Thaison Phan <thaisonphan@google.com>, sashiko-bot@kernel.org, 
	Eric Dumazet <edumazet@kernel.org>, Matthieu Baerts <matttbe@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 12:47:28PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does the syncookie path leave tp->saw_accecn_opt stuck at
> TCP_ACCECN_OPT_NOT_SEEN when the peer includes an AccECN option on the
> third ACK?
>
> In the normal SYN-RECV path, tcp_check_req() calls tcp_accecn_option_init()
> on the third ACK to update treq->saw_accecn_opt and treq->accecn_fail_mode
> before tcp_ecn_openreq_child() copies them to the child socket.  The
> syncookie path bypasses tcp_check_req(), and when tcp_child_process() later
> runs tcp_rcv_state_process() -> tcp_ack() on that third ACK, neither
> FLAG_FORWARD_PROGRESS nor FLAG_TS_PROGRESS is set, so
> __tcp_accecn_process() returns before calling tcp_accecn_process_option().

Agreed, this is a valid observation, though it is pre-existing missing
functionality in syncookie AccECN option handling rather than something
introduced by this patch. Per Eric's guidance on v2 [1], we will leave 3rd
ACK AccECN option initialization for a separate follow-up patch rather than
growing this fix series.

Marking v3 as changes-requested as I am sending v4 to guard the syn_ect_snt
update with !req->syncookie for the BPF custom syncookie path.

[1] https://lore.kernel.org/netdev/CAL4Wiir50_Z+m00GyU9BpRdAqgXs8V-L0S8kmmES=JiYyt==gg@mail.gmail.com/

pw-bot: cr
