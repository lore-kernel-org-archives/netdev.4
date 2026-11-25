Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626300;
	b=v+CwQs7Erj4zC67QbqW015kmV61CbZWPcAUYJTdprUXZ+U45AKVZOJG8cz57fDShoBDM
	 TqNq/CP5sRdBRJojmpTQO/m1mr9RNgP/hcyhyRGLDMmEOtFaNNnfIqLe7UlkYVbCwKlIh
	 Mk3bOhSvG4bxMXw0dnxL1Sd6cZrbis0bWVkulvbCNN0rADu9loejLPkNerqRF0JcljFZc
	 NVYtmeSbsBvo/hbMhAANeXqDTYlAHNrYk12k49bb7ndbITtFEd+6dRWdgpjljo76ubSEY
	 Aie4ULQgOeCm+M2tA6z8vukbd08cVxcxlS+cOua1NejI+/xw3J88NWu2/t9jFZWDfSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XDu0RE2qLqkN4F9FMA5I580EwKMJWPCFaxCVS6yhsfo=;
	b=VYo3+p7lPRChFNFENpgkEzaYNN15SyjdNA8fg58aB5WGosM1Rvx8x5nI4kkj4xR/RzGf
	 nAeVXTBb7S6Lenf24tGVWa1z7rQkHYaZ2UVP+LGMllsEVHZuUF7gT0Cc0P3gJF7hn4Mku
	 zJBYYGSWIP4NleHXKpyVVzh5A6sVMMyxgJyLX9Hwc/Z63TPsSI8UIc0ISpSxqQeVVef/3
	 3YjJTQo7oN/l67o6jHunR7CcgDUZbjNiHvnLeHicHAzrN3cochuCjHlmM4KJ1IMXyZdC+
	 Ur7PVGt1bL3bmAnI94D12TUR03Cyr40VHb6yzU9qAeCyIYKeLJg5KSMb58TSHtDkkjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlI7NdZ6;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51DA606A32D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51DA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlI7NdZ6
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1210724eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795626299; x=1796231099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDu0RE2qLqkN4F9FMA5I580EwKMJWPCFaxCVS6yhsfo=;
        b=dlI7NdZ6HZjf1sqzJlDb5DOKhlVyFKple/gNDaS6e5XwpFA6jde3ic/2XTVBd5JpH7
         G9fLQ4zVM0COeUqOPDuUl1sop/G5hkHOCt/77+E8W1EeXCaNBRUZbPyBdMsIVtZrduao
         rdQj7Ik9foTfSEFMy2h5jmwJYxgAAQzB3gkHFRY3sD0v7vqgG6bB/Q+YvVR1yamfzzY6
         Hm1fku2bGC0M4ziUerbRDW3puxBZT3la5acEp54YUBPKHjv4xkw7iVxaYpqcG6Jc9QKS
         CrWbmHtCQB6DV6W+lu23KQ8nO66s9fAebnkMPYOPxxpWG0NK0QsGzRVFTAbx2HbCT35L
         JIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626299; x=1796231099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDu0RE2qLqkN4F9FMA5I580EwKMJWPCFaxCVS6yhsfo=;
        b=ZYq26+AfL3AvL/ksCAZO2R7vvply9T64s8iZfdYHUXGbtOEXvE2tFD+Ma0ItM5R45i
         zv0tDgJRCAHykyth3jaEQB6DBMAi6Ljmr867WlGFMeFiZYO8fL5LrGUMow/5tLpZrw4s
         5ka5ZpRMyQsj14D3B7rCSbyQovVKEcz++e/iBhqL1qm3KBApJL4GKdWKRxeINqaArPrL
         sSEYt7+FxRndj8VGJZTqCPvvE1Ac8sKSnTsZsLlOJFAqzsURCqyBlvnAOXGQ4Gzm9VEH
         Ywr0ohw7NCjT0q2cBzPUX2WBl9lXgLjiShovbFAamiucGuilkQNhH00G+zRQgXYWSbOT
         JLWQ==
X-Forwarded-Encrypted: i=1; AL+hErFZI/aQU07Bw8xFMhIjhH0urQPmDmeqK1H9LPTSF8qmkgS95g7ELzeW/Z+D2c+UZaCfm3sUzwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fis8DGcXf60x7WskyFnlDsnjIfgh8KfV6FYkg27Hthce7dmKi
	y0nNB11/vDZ6JXhgYznQNmiK6JtHjpVRD2iFeX2tXAOOOeltgnSJl8GG
X-Gm-Gg: AZFdTZeE7NbJPSPAcRpjofr3bCIVb3KL2XkvZOxwfe9uo9JurSgA9pJ1XoLYYHuimvm
	YwHlzIEkLsIRqnGueQIvhTGhinlVztvim1J5PHSVHFRDFiKE71cm2F4VI/qqJzFG94V/2bpJuBu
	+fqqoVNwTx/I40tnNe4tSg7u+qSMCauskuHGf89YCzfrzseHcG5k0OJ76cJRoX6vejNwtbiU35C
	0Sm3RjzJgeFUu+N+ffQ7AOMVGuap8L4HZg/rBn4MeoDe+FDxLSEkVxudN1xS7N6wkHuIpLkDRH2
	b6PWTP1t4oBh6NNZD6OOUTkgqqH08O6BqrLL5XKTCfWCXOoxi7KXARAGwH+dQWWCrDRmqZIXdQL
	YNakd2vfRi/jlU+jWptvkOG4ucJeUZ3dWB8VZ6bC+4A+pEGjKlcTGSxkYQtPIo0gXcYX+sEwPOM
	oWHxjWY38GRfz498HtJkLYpQoDZeXY8gVTGvyNxuJH0PJg5p0GPjuQCOCWz4PCONi9OvapM7nFZ
	VkIYOBqhZuCC3lHr5GrB6++vTVX/pLQl8M5nxEsrh/yPO4kmIXZw+BY4l9PKd0F4PXoCycP+/IO
	o/N0fpuOV6ef2c4Va9nKkJw=
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr7888146eec.40.1795626298644;
        Wed, 25 Nov 2026 09:04:58 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:43::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm53837321eec.15.2026.11.25.09.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:04:58 -0800 (PST)
Date: Wed, 25 Nov 2026 09:04:13 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, kpsingh@kernel.org, matt@bobrowski.net, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Xu Kuohai <xukuohai@huawei.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/2] bpf, lsm: fix bpf_setsockopt() on a half set
 up child in inet_csk_clone
Message-ID: <awcUm4PvuYb3nGxM@devvm16445.scu0.facebook.com>
References: <20261125070330.16625-1-jiayuan.chen@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125070330.16625-1-jiayuan.chen@linux.dev>

On 11/25, Jiayuan Chen wrote:
> security_inet_csk_clone() is called at the end of inet_csk_clone_lock().
> The child is locked, which is why the hook is in
> bpf_lsm_locked_sockopt_hooks, but it is not set up yet:
> icsk->icsk_ca_ops and the ipv6_pinfo still point to the ones of the
> listener, and the timers are not initialized.
> 
> So bpf_setsockopt() from a lsm_cgroup prog is wrong there for:
> 
>  - TCP_CONGESTION: puts icsk->icsk_ca_ops, which the child holds no
>    reference on.
>  - IPV6_TCLASS: writes to the ipv6_pinfo of the listener.
>  - SO_KEEPALIVE, TCP_KEEPIDLE: arm the keepalive timer before
>    tcp_init_xmit_timers() sets it up.
> 
> Options considered:
>  1. Remove the hook from bpf_lsm_locked_sockopt_hooks, as commit
>     5416c9aea832 ("bpf: Fix the kernel crash caused by bpf_setsockopt().")
>     did for socket_sock_rcv_skb. Not done, setting options like
>     SO_PRIORITY on the child is what the hook is used for and it works.

[..]

>  2. Make these options work. This needs the child set up before the
>     hook, too much for a fix.

What is too much? Moving security_inet_csk_clone to happen at the end of
tcp_create_openreq_child? Or is it more involved?
