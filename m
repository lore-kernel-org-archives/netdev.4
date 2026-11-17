Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955619;
	b=VZV5VpJN6ntPSD3HL1Z5+RHxpsNZRwiVE3qtvynd6fzq0HUUadfSb9PDNMKZpKwJ7J2L
	 H5uEPYB6OVywc4CnzK2sbx9soIs7nfUE+GDuB9YQsAOk9F1NLMaqLOE3441xwsJFJmfYV
	 V1NpHXpZIDpPoWQhpqgBeMrY5vl23JH0N/0WJGpalIlV3EMtpAPEuUxzy0Y1jfNz2hCnL
	 CZinf73WiDPTJIvxMGkzUrDkWkn9n5Fv0YvzFEIkZ1GXN2kE4YoCXCzLLWWXkcqIO4HX1
	 DhWAqXPwktzXpOsH/Dk5eKpV/4EO+15Zy92vcZt4cB7NqPtX/Lvsyn0Wdf66CK/PnZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
	b=IdFH+WvRXwEF142xRBfv4US1DUY0TEWo6NF3nmM2h2OOusKA5fWmv/U6f3wE3GTcYKZe
	 5XlmxgjLln2ZvwNlQRdPSsXMdaHORJxBdGRU56muEHMRpuYMG2dJMUbdDZdTfpwwR3WB1
	 /OU5mSUqJMQcfJIrcdaNq7hS9MGqmySeHm/MfOcicO8Bh9C+TSuKBzzyWfzRnSuA8dR+C
	 UZCzAqC6QWBNrdQWwDPFP6uyav276JFZkmlXD7eAO1ZTh3pJHWA1eKWgE+HGQv1jsv/3E
	 2p7h9i8BBCQyQnU0kYbjfr84GaLj24gQoMSA4tKaN70kvDbg8711m/klxANoOo7uPPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=OpD+6PDM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A499606A330
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A499606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=OpD+6PDM
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfbRN1838643
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=KSC81XL1+EQ
	pdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=; b=OpD+6PDMlyRVIQ4gUsxd1pQRiiY
	2xNljoVElEeEhFUiOG5Uk44VLPG4O4uXpXj0+j4jeDetx+c0P8e+noxSYq2lCh5W
	KHejIzt/I4UdTJmzw+Fg/nSj7cB1QTMx/l3bO+xrP+TSeATVVrDxWTZVHibCW5U+
	hjOQG+u9uC1e2kybz2OaCsXrkrsDWl9/U/SGRqGmJY0vG7rKiLXndtlvel7lQl55
	sdjYVggRIUMT42oLfV5wteJXfkuV+1P3ib3Fp4ylW8JJJGpvlzjjnP6mzY9S0HdJ
	AQ9e8xf/1KwJnz4XcYTaX6HmGdSH8UZ30qmpl1eTP9PIAKGbfG22H6j3L9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu883a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800 (PST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so171805a91.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794955617; cv=none;
        d=google.com; s=arc-20260327;
        b=oYdpjP4h08s5Uc8scW/J+Khi6IA47RC86yO3Uw3MGFR6/xGzVn0uKNksHQMi6S57AZ
         68UHtgw4q94pHO/r04uafSr+lMfTFjkeUpU2tbgKvmd9+0DsS42LM3gMciGw7W74RgPL
         YYp9K54Xzo9UAbm/5+C3TEkzEm8iUZMFF+MNISKO9RHS86dhQhsGejCMzCq0Meil5Oq2
         aM1uTHpxTOCDeLYwBuft+YWbMdgA+2HkgML9oyTcDtziwDloN+fOYT9TLhF7HpudL/lr
         m1n9KCHmb/wMXHnElVCXxFzBWATZ7ILbQOtCchkZuXfBAw0xyjeflVHUbI6YyMOlivpX
         F2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
        fh=qod244yoB3Swx6BT8pwI4iCjWBm8w97P4EwtSYE3820=;
        b=rd28UaHajTcIq2aiiXm14dfPuReewFl7CQKwTJe0vAEYTzTDizm6C9w19tMk8TGo2R
         AvUb2ZnDHYME+HeWWXwJKpkbvFgU3L9HCUde8epiqk1zs4tcEjSNqsoYUp2k0GV5hws1
         5xPuFQ5id/J5BJnyzJ9V9DiYk8FUaQ+XbZ10E38R/LSSLboTj8KHanYWj/QlfMs01O0C
         cgHYsSvGuK41ZtfTZtDXZ8nzSx5dk9U6Q+PggdAcjgWAS3pUBeEyytR0qZnaAOxJR6YA
         7VbDv8NGPx8Pj3ZBMwC0Oxsg/4SevSmPyOdXx3PbFbZlxizWYR5HQFyGgudbC1wEsCz8
         YpeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955617; x=1795560417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
        b=AAntb11x+ZE6NSqkF94RBGbtfmJOKLbpACuM42zOaASjxZprO5ZepQr8jF2jMdSMMr
         GSahuv3z/GxH1KkxxVi8vEHkzkBIJrzGpvHHG3zOuP4Jks4/UQcmgvmnzv250p1/ZQ4h
         snQb6mF7DaeID1yB4TSVvIcyQ0+H1/Pt/FKT+o2xD5ABJbU981dN3Y18ERidAQpa/8Gf
         BSZ5o53ihAqdIsDKqykenuMrj/BRj3pdYdKJGgtypgYbsOLeHkpm4uaTWqSCfGmo6drq
         WJEvm2coO5gk2JbRJEV5G911oiBdIeDdpEqWoPLOHv9SixkVIXqHhWKuPs+gOH976CuP
         JBxA==
X-Gm-Message-State: APuU4Z8f4zXxokRGb4EiqGVItfoLPge8VhMQAortbHb78YdEwiAo/XZd
	aWNqmqHHe8dViJBqcoAmiRd+twhK+4cpGE5kaO/Pe0o+qs0IQfE+Kmd62X6Gt4GYAwwBB8jWH8u
	J+nshzVt4Cm6EJeXrJVHHjyKSyBkwebyEqIZFrK18DYtEx96eUQt86tmLi44vBzvTneKE15keFD
	772IKSNLsbw4G0P+IcEcndoj1fDuc2JkM=
X-Gm-Gg: AZFdTZel2mTUZyamLMvfONIg7NUofGoAZB8unWMlRVPZf06AaNvntbfO9HBQeddXhCB
	hN6e0x5Q0QigWFCH6dvu9yXL0JQguTHfHQ0gYcanhls+JQiraCudrE8OIjzxXE600knC9fttZTC
	JU5jlDNfQ8uJUoLTflB/MeW870WEXkPdQGo9Y1/B1K8/1nxO7rto//QMbweoluFv/qehnKcgD69
	PcLLw7g7aLTvDm6iSek5AiCGs+r78q6fbiuwH2+4Ah9MZDp4Tc=
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id 98e67ed59e1d1-3b3d07a212dmr710179a91.13.1794955617267;
        Tue, 17 Nov 2026 14:46:57 -0800 (PST)
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id
 98e67ed59e1d1-3b3d07a212dmr710167a91.13.1794955616819; Tue, 17 Nov 2026
 14:46:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-10-toddfreed@meta.com> <179471270451.2199510.14795764193886368841@kernel.org>
In-Reply-To: <179471270451.2199510.14795764193886368841@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:46:45 -0800
X-Gm-Features: AclHuK_60Rb9y_3QFrgeQGfRKqUkPpfoiUhcDbbJP8UTYE_KV9Woof2OdSMKaMY
Message-ID: <CADh2yMwGN64zEVedBhYbMDcsyPjSJ90tyPz7evJ6x7B9pAk3TQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 09/15] net/sched: add act_psp for psp
 transport mode
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfX0Gw0QOxYuccZ
 5Js+LE/U2kzNC9iLW5v0ZDQStY0sc8cfHkzikoowd3crnIwJuOo2lr0UaGiXZ5vFcIlJekTPKwx
 pEJAUyvvI4GqcI4b/r+bZOHkgdOVuro=
X-Proofpoint-GUID: V2m6IdXYwU7xiBY8ZiXMrU1Tj-6i0dtG
X-Authority-Analysis: v=2.4 cv=aLRlOr9m c=1 sm=1 tr=0 ts=6afcd962 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=DHOIGP5XwAi4GC-hQCcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: V2m6IdXYwU7xiBY8ZiXMrU1Tj-6i0dtG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfX/rTzlsUQ3nBV
 pHeGvPKEWLjPWSfacKY0XjY/Fj46kZ21+YrTRwWbzLKc5P7PnQ3jYKwftnFkvb06s7lWQ3kavZk
 NP48vXe+2uNCC5N2P15yrci7PENO4W7dZBI2QQ/2Z/4QPQqsnWoOxcyrAS3k0FVm7Le/RYr2God
 fqq6UHvd3xPxy6fOmBVirIeLOksWQek+y69U5ZDYjcRJ79JTNskssnPTl9N39P/aVzARXHlbXMx
 jDfnS9HXYCndnjBsUdRl2NubV77HZ1EefOxvpdCsLjSTRo37uzPt0fpX87bxxv7CMycG6DSgpKE
 uNMFV5YQbimuWuOOS7JNqZDnKBKZwwX6cYqNSStXebSrxY95Px26Nz8Wna2kFVJ7ps3Aq9XcEh3
 GSCTIltQgnBYiqmnv99pvni0iVokMdJfHY9Lkq7wFqLCNXp5apsb+j56TWMVlR7kESb1fJ6/5Pl
 EnwmcaAN470cbe0Nu6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Can the METADATA_PSP dst and skb->decrypted get separated after this
> point?
>
> The commit message relies on skb->decrypted as the backstop: "on egress,
> encap sets skb->decrypted, so that sk_validate_xmit_skb() drops the packet
> if it loses the METADATA_PSP dst on the way". The egress to ingress guards
> in mirred and bpf also check only the decrypted bit:
>
> One path where this happens, on a non-PSP netdev's clsact egress:
>
>   act_ct (defrag, sets tc_skb_cb(skb)->mru)
>   -> psp encap (the reassembled packet is not a fragment, so it is accepted)
>   -> mirred egress redirect to the PSP netdev
>
> tcf_dev_queue_xmit()
>   sch_frag_xmit_hook()
>     sch_fragment()
>       ip_do_fragment(net, skb->sk, skb, sch_frag_xmit)
>
> sch_frag_xmit() then puts the original dst back on each fragment:
>
>         __skb_dst_copy(skb, data->dst);
>
> As a result, every fragment carries the association but has
> decrypted == 0.

The fragment path is handled by "net: don't fragment decrypted skbs" in the
net series,

https://lore.kernel.org/netdev/20261117203137.804424-4-toddfreed@meta.com

This causes the skbs to simply be dropped instead of being fragmented.

> Would it make sense to do one or more of the following?
>
> - propagate decrypted in ip_copy_metadata() and ip6_copy_metadata()

Conceptually it makes sense. But because of the fix above, that would be
dead code. Furthermore, they still couldn't be sent. skbs which are to be
encrypted on tx (ktls, psp) need the L4 header, and non-initial fragments
do not have it.

> - also test skb_psp_md() in the mirred/bpf guards and in the cleartext
>   backstop
>
> - have decap refuse packets that carry a METADATA_PSP dst

In both cases, these guards would be dead code.There's no way for these
to happen once the fragment path is closed.

-Todd
