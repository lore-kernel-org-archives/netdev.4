Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455068;
	b=MwocXsK+sFcknl1WbvXEn6iYSbe/Ao+7zM+G1sjirBFHaiLVqaHyR89UlJoYZyt/1RsW
	 mWzEOHSksUTyzQpgpdc9hi3kH9dZahJ3NlOtQcAZKPQsjLoloMmrV21EnefThYldIVXG1
	 q1500ujqzIcu+LTiGJgRNbXJRQX2U38qNH4KPMk2dEiwaTuYBUxmO4/nc18YD7O1MBqEs
	 Wl4UT3wAef/nY/l50DBkrf+h0tgWvjCDO3nIDwcJ9ReaL5383iiMzKEePdL6VyKP36Nt4
	 8OdhuN5YImtroeeVVSHMMfmq9jf4N4lkXoCwVujATaGzIZy761PIjbweb5SHBTGWg9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qvkPhP5b3A5an4p/DWz0OZq8/22sCU7etx6E8porRvY=;
	b=uKA4j8zc7B56wT8dC8zzN0hDpp+D4SZwAbvfMc/6qj9Zk5yABva7hBOzm497TjpWyzGE
	 vsAsC5lnNjRLMQyvieTwB1H85ogaooluEeH43W4PujSGQcxvNL4jLMSDYPKkY/EkzKN7K
	 6ja3Tz+KSpfF+RjqjDzMqziDPGzaG7pDs/mDqaBM01eq4oul5vHL+VmSJDF3aQJZKgMvZ
	 KP8oioicqgK8QQS7K+1L2rCOapfAyZ+w1peis8oYgTkKLPXPq8T3ZO2BMIch1nE9+6Xyv
	 iiEyA+sCKWbaUAsqY+iG+aaGMrpbIJOyep98K6CzogN2rgQvfLi6RfkKbMuJS/cKbLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNmC2Tnb;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD512606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD512606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNmC2Tnb
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-3869f03af6aso2689191eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455067; x=1796059867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qvkPhP5b3A5an4p/DWz0OZq8/22sCU7etx6E8porRvY=;
        b=DNmC2Tnb2kbCQILoT0wHXYnG3bRtA3Ma16+gcP321xg85IPuu9ora/8pbC5ZF8khgU
         Oh+82QOBIr0JKl0IroBcnnHBH4+bz8Lc235xV7D6ZPq6Luetdx7uQkrNSBhJelgEo6ka
         x8h55QfewhjtX9HPIeU/Y+TAzAD7bm7Y8efHlotaosN138VduF5buGU19CFqXHiTUdFQ
         KW7knHHTZDxmP6bW0jKEZP055w9MQCdcz6V4Yl7fUZYMQb8A+R8kddOEIkKwRDy4lXt4
         lfrwI/5mDLzTCaDKL5vpB5lZ0Zw+nONnudlHf//1V/v8er0Loz3hIyvCENnWvRwo2Elx
         gIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455067; x=1796059867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvkPhP5b3A5an4p/DWz0OZq8/22sCU7etx6E8porRvY=;
        b=gbuu9/mMAUsvvBADnJTiFPv5C+/sYFBwxSz8Xv4I70A7JqP0syTduEKC+zp6rU0iSK
         B0sXmOKpiihrwYTwor2oj+k+yjnkabOgVWwxy5bsjWohAPK2yd2tXbrk2WTFXyJOIvkT
         lmejeclgJXBtH9cr1hceEbvQg6JQpwK2bppTAQpBkcOSAM5On+POghvYNUC5O1ZKeYeO
         XAabOwqb2NLbvRAbPPYI0+tIc9cRX01htdCz3GbMnibCVmI3A6AVNlMNhxUNPpbmMoKR
         +nV3Uj4W+1Xr8jpuRoPDO4rNt3wPpdK/AyMqSFzk+9b3pirKw9ZTZpbn00PjS+vcM6uT
         EdYA==
X-Gm-Message-State: APuU4Z92dKggSaUUZctZyVoky0aIdVylzMC+7XQKOqSX2nIkiEDoE2Q7
	HIcsuXhlthwIrSSksh9KANuSARDKsZcpwez3AgVRFDQ45RizWmzi5wef
X-Gm-Gg: AZFdTZfzjaZy0W37xc+zs4SBssm5W/qxsJny1YbF59iHs7MZSgkebm/SjHZdY4paIEU
	OpitKUZAzcE/Mw31mrEzB00Qtae27TysjQoeZfv1e6MhCtLrPX/ky2YGkec/4MzEUFmSyIUpJ0l
	ZK2o0FUz7tec5gqrbow0HV+QUZMb//jSDjJtS4l/uK1Lu8FL0ogy2wfZ5ZaLf2VkzVhgS+uskxE
	qWWBZKQxLM1zodLDUNgEle5SjQ1UuaEu8nwDAxSwN4HLuQ5QtgruS0KsTObjWM6RyVhwaqLNIj6
	oPw/5q/I88brUCA+eZS2DONVdKhyp6nkeIy3YlWSlHH89g/ZGs799AS1a+H7kP/HXf9SanmGN3x
	lV/OELIuHq6lBcvkxOwy2yriQuIYgPn2pP1nZoTO/DDhmMAY+YYGmMS/stm+6oaMbaOBLYeCXFk
	ldw/xZqRrrANo7EtKBQOP5sgVdDsrK4QE/IC3S5dCmeYj51egChyC3o4hp6zW/8NwXXAoLS5tJo
	NO5on6rPAWPczYlJIuZfmCjErXBucMbqP1qxMI+1V0m5RZQonxEcfbKDBThCbSzi0uSBEPXWhiE
	nCfpWixfP4bSaW3RrcC58boV
X-Received: by 2002:a05:7300:cd86:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-384b398741bmr19298959eec.5.1795455066599;
        Mon, 23 Nov 2026 09:31:06 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm65302882eec.3.2026.11.23.09.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:31:06 -0800 (PST)
Date: Mon, 23 Nov 2026 09:29:00 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 2/7] net: devmem: prevent mixing TX bindings
 and reject non-devmem xmit
Message-ID: <awR33KgdxcQEwGHM@devvm16445.scu0.facebook.com>
References: <20261120201408.3445445-1-almasrymina@google.com>
 <20261120201408.3445445-3-almasrymina@google.com>
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
In-Reply-To: <20261120201408.3445445-3-almasrymina@google.com>

On 11/20, Mina Almasry wrote:
> Two devmem TX paths do not validate the fragment memory provider or
> binding strictly enough:
> 
> - When sending with MSG_ZEROCOPY and SCM_DEVMEM_DMABUF across multiple
>   devmem TX bindings on the same TCP socket, tcp_sendmsg_locked() and
>   zerocopy_fill_skb_from_devmem() only check skb_frags_readable(skb),
>   allowing fragments from two different devmem TX bindings to be
>   appended into the same skb.
> - validate_xmit_unreadable_skb() checks the binding direction and
>   target device only when net_is_devmem_iov(niov) is true, allowing
>   unreadable skbs backed by non-devmem net_iov providers (such as
>   forwarded io_uring zcrx RX skbs) to bypass validation on
>   NETMEM_TX_DMA devices. Using netmem_to_net_iov() also assumes
>   frags[0] is a net_iov without checking first.
> 
> Add net_devmem_skb_binding() to return the devmem binding of an skb's
> first fragment (all fragments in an skb share the same memory source).
> In tcp_sendmsg_locked(), check net_devmem_skb_binding(skb) != binding
> only when a devmem binding is active so normal non-devmem TX keeps a
> single unlikely(!skb_frags_readable(skb)) check with no extra taken
> branch. In zerocopy_fill_skb_from_devmem(), check
> net_devmem_skb_binding(skb) != binding and return -EMSGSIZE instead of
> -EFAULT so tcp_sendmsg_locked() starts a new segment instead of
> aborting the send with an error. In validate_xmit_unreadable_skb(), use
> skb_frag_net_iov() and drop unreadable skbs on NETMEM_TX_DMA devices
> unless frags[0] is a DMA_TO_DEVICE devmem net_iov bound to dev.
> 
> This issue is theoretical and was found by manual code inspection and
> LLM review; it was not triggered in production. Compile-tested and
> boot-tested with the net_core KUnit test suite; not tested on real
> hardware.
> 
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Fixes: ae28cb114727 ("net: check for driver support in netmem TX")
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
