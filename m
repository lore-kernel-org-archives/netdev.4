Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531085;
	b=ouyqnxS3vnDPOJ4A3f0PdsS7wqlHxLVh6DkFEmTZqLZ/TEHwvjKlPOUbJCmY9esVwyr1
	 32WwUvikaD2wWFHr2RoSQegu9hpMzwr0VKbJUJKNkjTBRbibrKgxn4QA8s6KYTcpJ9xoP
	 nj0l05VMWpfN02SpYSn2ogJzprRJqLdGPQL19US9g9UJH73ShvTkm0CwchGHADZ46zoEF
	 5uJURmIGxnYSVI7j7obbJ60j67MWb74eTjk1ZJBO6Oe7LqTNlmYvjtrCiA+turTjU0cxl
	 C4+7Gqknp77bsTn7tVZ8p6Z14Ls1vE6mEAplE0r07Vu3CgcrLAA32sgbev8logRAheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TXF4UCpmnFnmbQujb61ZHVn+BsQR8wZ6idVaNwcyERc=;
	b=t2Pp3NsRY5iLhF8p27Q8+w1tsdrjZRq9qyJbJ95JMve3sNkzknkGdN+Ao/cVaGNOfJ31
	 seTK3wPItRo2izJc0b81jhPEaZjbrFLU8WnlxsUwcX/9x8b8jOjXn3UGJYD7unMV7tTc1
	 6+Ct3Up3x6DEr5DH3vCXVWs6ASq6Ov/6k4hHYTCBEXKiGOHnEWBak4iHidpXj3x3+2PXw
	 LvTqMG4CdIho+5GgWW3O+/TNAezRzQttmgnJguhrdcEwiK+NAVKpG6Sf2UV79IWjD907P
	 zC8dNQ5lbwchAbC86NBvnAHlCzqVLvXzSvm8itYHrjx/eZ5jHxkRBDDZQb23/rCAqLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaTeu9Zj;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905EC606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaTeu9Zj
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93a40a9a01aso663561285a.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795531084; x=1796135884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TXF4UCpmnFnmbQujb61ZHVn+BsQR8wZ6idVaNwcyERc=;
        b=OaTeu9ZjnHKqxhdBQhy3764JrMDTP9EzLmKhiQLi6x0+MBiKIpaHhKSH2dTs4aoELH
         c97jTtQezwiOl3Oa1++3Ega30H5eyAgWbBGrO8G0JmMruRwMnBMYAoTm3B3HkAM+Rng9
         ST7sOju9EefZG1T3Z5029pd/19VNxqs3aj5u3j6ijH/OXliL0He8i4U4OESvmgf3JLSL
         p4LmE7Kk+1gnHvGdJQyLoAX2JRhIFr0M3h3cq7vBZTct3DK0huH295JXs+GRnu8JXhRR
         QXsPsWUuF2hdOfpRAXvnlLGUAs0GzM12Kru7Rk2LCpBF2j8o4eewLNePP6TFIRfQSxEB
         Gujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531084; x=1796135884;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXF4UCpmnFnmbQujb61ZHVn+BsQR8wZ6idVaNwcyERc=;
        b=hqbqaxENHzfBgmSN+HWCoDL3bACu2oaJNMldZn0XUAADRzeCfUydlSaVmkBxdy0O2y
         Q1qoeyhBUYDBG4AtjkGH6/8aoPfgoAAT9psTrEngYgCQYGL4qy01Jj9jqbd/bHK51hVj
         t0RerHMQdXtZmVQnh0/MFf66Aglujvrqswq5R8LaU9ZkL0ArlzDLHU7LNYldWwGmDLEI
         etmvriTvCyjG9+szo3FXQ4y8U3i2d00Mk8+hkL/SnRi+IS+LY9wtphSQsvGyIeMwsEol
         nIIYY7P4Xn36ocZp0AMpi0RhAkN79y29P0uNHT63xRzZ/QyY4dfVzEdhEoK6N3eg30s7
         POzA==
X-Forwarded-Encrypted: i=1; AL+hErEt8nr3lGkJBz2yqXaJ1WNEFG9OVRFP2sPToeRrDUUMlrJ0WI7DIeaERyPVr0D3asP3xCgfuyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b06jBR4RmV76GP+nLJUrjgMEDd9dnF4fVJkLVIQtNY3+vuzKS
	FbWG7yISl5RCIUIKu37UfjpMemskdWHc3he3e4gV2Z5AukNsnRN+gVLA
X-Gm-Gg: AZFdTZfcZEUznCp9RK8ARDZtBF8saw+QFvMXMF/Y4EX6P5eyUM1W9YTqOsZUootC4bx
	9/6Q5DbctnzmMzbfkIpI15orMHQMVONtRXHbeVRt7Tiw4vXQE2iQ2JCVCtsZGa+4dsoc+RxWyFv
	VWrB9vIkDY+9RgzJQr9N8WzVGn4kKoxk6AX34ovDc1dmgwPwKzPvQwZH8Jr8Eov3Da/oMn0qQYQ
	AHVUNQ49tu+iRAiN93Me8Z07l+bP5YMRIlqtJfQLaA1XuhoaMMTvpFCnjS8blaK8+HtnK3GuCJk
	JYwIo2ExpZ+YsdaXua1lWCfV9qlmXZRkz4oqOFojTcurFIMUQsYzwtn1h2I5RF/LqlZEQlXnXyS
	xOJClpjfPdnnuEX6NnWCvkJnxpiH8GhL0waxP4K9WoE1uGN/SZFjD0qiDY4NCKGMjP41j0nLoWN
	tpt/8x8oGIMrvNIxzDbfMVN5aCHbREsJCgx9F5+3II5z+yEhgFvL/Xn4o4hW7oC4RrQnfSPG35L
	lQXKfhtijLe2xVlbMUolPiqXhhw/hzY2uIKGH0tSw+FCIbObyiaVorYv0WnsvtVvKQa0wzDtTVH
	DHiaWuZkPv7Z7z27kRmhfpbUI9aUUWAC4veUDXxj45kTlKjB9Cw1UFReytWs5VuEo2Xdx7yjokK
	EnbHoTW8vO89KAs1pznLuJ8TpWXiZCqrf4lAYc2XfamtFCkjiCEUqUPs+UiYBm/GuAaLjJToZpP
	/Y8EuZMKp+
X-Received: by 2002:a05:620a:4592:b0:947:af55:40d8 with SMTP id af79cd13be357-949ba955b65mr2471290685a.9.1795531084469;
        Tue, 24 Nov 2026 06:38:04 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f5c31sm1060219285a.30.2026.11.24.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:38:03 -0800 (PST)
Date: Tue, 24 Nov 2026 09:38:03 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>, 
 netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Josef Bacik <josef@toxicpanda.com>, 
 Stanislav Fomichev <sdf.kernel@gmail.com>, 
 Dragos Tatulea <dtatulea@nvidia.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
Message-ID: <willemdebruijn.kernel.18018d6cd8e06@gmail.com>
In-Reply-To: <20261120201408.3445445-1-almasrymina@google.com>
References: <20261120201408.3445445-1-almasrymina@google.com>
Subject: Re: [PATCH net-next v6 0/7] net: prevent mixing incompatible memory
 providers in skbs
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Mina Almasry wrote:
> Enforce that all fragments in a nonlinear skb come from compatible
> memory providers (and for devmem, the exact same binding).

Is the following correct. Not an automatic need for respin. Can also be
addressed in a follow-up.

    IP defragmentation (inet_frag_reasm_finish() in net/ipv4/inet_fragment.c) is
    still a gap for the frag_list invariant this series enforces in
    skb_gro_receive_list() and skb_segment(). Neither ip_frag_queue() nor
    ipv6_frag_rcv() rejects unreadable skbs, and when skb_try_coalesce(head, fp,
    ...) returns false because head and fp come from incompatible providers (or
    readable + unreadable), inet_frag_reasm_finish() falls through to its else
    branch and chains fp onto head->frag_list anyway without propagating
    fp->unreadable to head->unreadable. If head is readable and fp is unreadable,
    the resulting reassembled skb has head->unreadable == 0 with an unreadable
    frag_list member, bypassing validate_xmit_unreadable_skb() on forwarding.
    Please clarify whether IP defrag is intentionally left to a follow-up (like
    head_frag-on-unreadable) or handle/reject unreadable fragments in defrag.

NB fragments here has two meanings, skb frags and IP fragments. Where
possible, please use unambiguous wording.
