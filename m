Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562883;
	b=0kA55zGmXYTJBB2rYLFvv4sOHuPpWnzatkpEsbyZeonsHJSQ0Zq9XpWxhGcu/Xvsci/I
	 Y+59xTD9G+NTBy32O0HOJ59lS6NRlQdP9grT1HLANtFK5cUg39uhKCSPogzwgzMYETzOA
	 mdvwOyCQbVaRivXkRUc0CKxhsOwucl6G7A+fNmcZDeGRtVcYG+w44OWSYYjzl8dVx8WJu
	 LVoS/LBKtKu35IXbrlHBUuGEQAfOK8094ADAATuzTrlXHHnCNxa/mReP+ixwElNAhu4sy
	 oJmVJ95VuOu84YxETpqdrG3+kDtbvnlRwRY54GtbO2jIYpplN7lC0xfiUJmtnimDSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=FdD8nsrRzbhjr4E3zr0vV9y7hTxHd4p7KVaJoR4GPPc=;
	b=PgMZ4Gte8JSBY6ikNn6ryQHqKnOBmMCSmugYOMrbcRIbyJHv/QdY54l8XjGUKyBKIUl+
	 fKk6ztb01yzUvTMs1Y3enIpP+CD1NLuN/ECxougN8fKKIWd9UsMoIA+eTaNNOlgO+7wS/
	 CXlCakRe6WfLP9FCIO7IyeOILfekK7qWQC5wuLzWhgb/y81JLB5zBG71n31L4w2hsXI6B
	 hrD5sw6yPMd1SvZ1xRyYZdM0c1s2YAsj6sGMeB6Hiusz5CeTPvNfNQz6GSwnTAF2iKMh4
	 KGAzjBkoFpbP0jk7ZjW04BXrUPKzpzX69uxpTRygOSLJDhSmgOx/xImYsljfYsA0MvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+nyoquG;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F299606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F299606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+nyoquG
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f06ff94acfso19902205ad.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562882; x=1796167682; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FdD8nsrRzbhjr4E3zr0vV9y7hTxHd4p7KVaJoR4GPPc=;
        b=z+nyoquGn02pafXKCrdr3Klc70j/V2CGP1tfLUWX99+u6+I8AQM4rTPVVJOLTTCqk4
         KZq3fqF7MnYuoS/E5OP6DCEl1dNF2FXUNQKnCa33epliUESnZbONB1veRdgYsTmHe2lG
         qm4cU0xVdcxJwS6PQUHUUNTde92u1yhhObcq0W1n4ACHAnWrNPptnbyY0ad9VsEOHoKy
         AtTyAxOfPBTuljEBcmxOk/ue26foe2Q7q86H+e/qn3BI/gKKw3zPsE5y3xWA/AVWZeI1
         7GKaH9yyK+uUPZbcKAOEJYMmzScNmB8t36p8LCSrpUFg7Z78wnS29XN3esVKd9VllLeP
         /pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562882; x=1796167682;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdD8nsrRzbhjr4E3zr0vV9y7hTxHd4p7KVaJoR4GPPc=;
        b=msKerNP+m5ihq7wfQEbxZEt7xW6Pj6POx3jWwdzQieBhwNHtzscpFVFJCwDjHPIzOo
         KYCtYaet8qCJcQAUya3jsjVTxORqssphQoG8oTcz7mmtcxI65aDppIvGCdr7Ko0+Be5i
         ZWY52SIWJhTDamXk7VNbHz9bMP7P1M0n9xYl1u3ozHIyGNAqJLNnrid4hp72YqTbWa0e
         ineQKwN3lT1in/5rZ0u24MIxFLoZklwCYxvKPKb2oUFbFiZmcaJfAJxj4rCMX+ytIlRt
         KaC/og0FzOdIjnieDXupjZhyfUupKynx37gL4VYT7LB8tLAODr52YCDHBR7GCMnfWm8c
         We1w==
X-Forwarded-Encrypted: i=1; AL+hErFxrHvn5AgDtnjZdjmiTgoVFvtj3f9ZPTZDDp+iWFdz+DN4ef56pxbhs0ahI6uUv8S4JQVRsNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BP4EMq5GViFw/ihL162sXWww/zJNwcQDU4IFCoWAnwCLRjjzR
	Tq/YyoDnmRGh7a77O9Zw2/dXSbsosaIU/DOcMBkAsfKzFk6iGnje2gbY
X-Gm-Gg: AZFdTZfUl8xItcN3wHu/AgBttRCExZJe6eulbKfdGLMuKxUsgxfFCmeMCaGHRxViYRa
	mNL6ayTzNcF7QWayIsl9Q1frdfqH4uwXs0PcH8PP3LHy3yR8huj9YSo5GzVt4Zdg9pqx1S4zOOW
	8T8XuWit/BkWDEzI0Vs9y3sFbc+RrDutdY2cs9BFhtA241sWwR9sQ5rD4e7zwm0/ZogFJY6y3S8
	Cn88aIHs8SezfQwqgzwD4h5leFvAiPXKS3yOTfbinLb9PoujMjYgjQ4n7hHbmSx3ocCWYI0t3JP
	yieIZLdjfb9VVr5BeQP0h00CUSqNGnP2q+Ma1XEn9MiC08uaZY85hQtU+UvXJbApMucz4qWrGxu
	7QbKWLxCIPsmqjjdisolA1bvZtjo8Ot0LW+2YukZbzLvo6Vle02bxXdaaLz2rmdoDXBWS5RqIjc
	1D081FSKMuiaIErFZEY29k2n/L57cVQejbrRgBBDyE7EoExbzj1sWOCE/pIMUXdlY5m92m2PZ1x
	kNDhEeqjt3CnCYG8e4g0bpsrlEWEGxVlhCEHV5zM6oSpq1O2eWA4BuEVnwis6ytq4+tVMb21wZu
	i66RDXDvbVqTLf/2KWnurNNhx4YiuyPzpNOsMJrD0RUOXyXolWBu1b60G/Rbjbc+WUWRztlfN9e
	Q6Xrze4Zh65za5Z8k4BEzrnawEwiaT3Zulg==
X-Received: by 2002:a17:902:e80b:b0:2ed:ef1:f78 with SMTP id d9443c01a7336-2f03f11824amr157910985ad.21.1795562882035;
        Tue, 24 Nov 2026 15:28:02 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm76166185ad.51.2026.11.24.15.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 15:28:01 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 23:28:01 +0000
Message-Id: <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
Cc: "Gwanhyun Lee" <gwanhyunlee@gmail.com>, "Kuniyuki Iwashima"
 <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>, <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] tcp: avoid NULL skb dereference in zerocopy receive
 with sockmap
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Junyoung Jang" <graypanda.inzag@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Neal Cardwell" <ncardwell@google.com>
In-Reply-To: <20261124230228.3868519-1-graypanda.inzag@gmail.com>
References: <20261124230228.3868519-1-graypanda.inzag@gmail.com>
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

On Tue, Nov 24, 2026 at 03:02 PM Junyoung Jang <graypanda.inzag@gmail.com> wrote:
> Check tcp_recv_skb() before using its result in both paths. Also stop
> before advancing beyond the last skb in sk_receive_queue. Neither
> check consumes data in the sockmap ingress queue.

This should be fixed on bpf side. Other readers trust copied_seq too:

  reader                             with stale copied_seq
  ---------------------------------  ----------------------------
  tcp_recvmsg_locked()               WARN "TCP recvmsg seq # bug"
  tcp_read_sock()                    frees new skbs
  tcp_collapse()                     BUG_ON(offset < 0)
  tls_strp_load_anchor_with_queue()  WARN_ON_ONCE(!first)


pw-bot: cr
