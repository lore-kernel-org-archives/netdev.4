Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455070;
	b=veeJ4/HdZmvvDG3ijhCeGo8yc46w7h70PVFsfTkuou40ZZBkuOG/Kv+DddPGGYHGSUWK
	 8zq6uJ5p+KMuXxe3biMQM8zu2/XSokgSOqcBg71w/w8CPxOYX57N7dxI5SrJCCKlHSIPR
	 zGL2g85mLzV9ZfBk0xCQt37qP4s4KYPvShhu40Cq+zI3IcJWNftUDa7GdMLMtDqIMdb6F
	 Z7TOkaHOkq6GqDYD08jaujQ6ADHPm/xDdAghtL9nTHzDJqLr97SypU72Q8jBuMdsiflcg
	 CctQAEalFnHJxeNIrpAK89I0RJ0R5E4i4qKCQaBbyuUegGB3Dt8M1nUlAs3DBv762SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MLr6IU7aoILkCtwQLyh+OR8fKUKvZHDBkRUn8D77G6Y=;
	b=icuw/q0ZN55mdsB59B9/ONosAm964bU+7z7ApjUlltnTRkMxWZZAFPJmfIxWXXq2e/tk
	 vmrwogyNipQaJMGuKMNxU8L98GILHcTSwTy7EAoiyMomwqMRf/wm4GHXKp1RWLdVyYwoh
	 sUf9NjMYsE1gk0oWlzREDzkJDnuqD3Du55Rl2JeM8zB8oGM+kcwXzj+SE6z0BfvcKZ/5I
	 gzN02gqTyhFhhrfxwDeC7ZyRmqy0dn48a4e1HxLLYmmWKuV2Wb28mDCrmdcF2ld2RmUlF
	 Cpslc23fzbMRmtNx3Rw483Vju03qqw1UAdYGzdgDTNw8yRoP+s5LVP7rSRz6tTFmCqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYkRgLbT;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6D606A681
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE6D606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYkRgLbT
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so660109eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455069; x=1796059869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MLr6IU7aoILkCtwQLyh+OR8fKUKvZHDBkRUn8D77G6Y=;
        b=SYkRgLbTrIbM8jDG6+zhYPWJCszVMlJYwrd014YIDNXhqO1JBjn9Z/p6o9flXWpsJP
         tHf+Ar/3/USnORoHC9bswitEhr38ytLf+ca+n8DBKIxFoexwkzINzdfQSeDOc10RMKL5
         PhlJ50Dh4W156eyu9bDIXLam9QVzRP6sRyy0HiuXS6zd5mlG+YilfwSbr0zpGO0oVqhx
         xfke8VPkNhAbkmW4Bciu4ouwUmbenGkfcspxOuM0nCLcNqBdrmznHvCLX1eXqN78NnJA
         E7EhTZmI5xzZujgXUGhflQKpHIJT2W953pzikeeOWsZWH442bQjrkwMtwJXwj/SvquPC
         LVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455069; x=1796059869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLr6IU7aoILkCtwQLyh+OR8fKUKvZHDBkRUn8D77G6Y=;
        b=xpkmCyyMe1HKOTMaYQ5reUmraJnh6W4MUR/CPNprcqc0+o0jZGyuMvLJHCjjXEcOul
         Alr1y6hEgrPCS3JfnzHMTPoTSRIeRfbthc53/iGpHcUtrB1gsn49isoIKtSvsG7CI/MJ
         TyTkXfKnlC7isoX418Y6xcqeL5C0Vd0FEt/Cy5HbSkG925wXkSVG349JLNJfGj60Pn+r
         D+OjSyNPcn5uhoMDivN1/louBNeWBh4m1zvNqujO1Z6qTgGB5HPoupeyZLt47ifQbyqK
         4/C9havypE6DMQdMnJlgQg/NQl+4GvptW4O8/JNKDLgGySPnhbdiNA/8c/LWD9oFBVh1
         Mz+g==
X-Gm-Message-State: APuU4Z/+Jvhwb80PJhrcCr404FRwxFDnbiX6XjdSpgIqdKwYs05NorFY
	2qaEmtr2vfow7YSvYZYliBT9SWUOa1SK+hhb45a5D+pNdSB7kdRFGKLj
X-Gm-Gg: AZFdTZd2RjpckC+Opz8EQZv/xVCZn0PcHuQm+TiBUyXA05pdTu8QHdzGfGboGX7TV8n
	a3olQ3hvGVoXQf6ydYmWewwUZjR4MQgGpZPeRWtR6O29eUEtZh0bOXUXB+eCLGIiHuuJl99U8wf
	rLV4DLPwNeIZ5jKgkEa9xhOHyRcjrl7J2KqEjJvJZelMjIzWdedrh5sypX0jCPIlT5BOrbNNqMn
	RzXPU3AVgnUwrU/Y5imXhKWqIbb9/NITyU7ag582cB/DvqlhuOsEiWqdG/vRGxT8Mnn6VWGMh5O
	3u8FaeHUOSg9nYNjuLE/CgAldwaZu6ySx0pdgOFCdmcIGmt8qwG8TSASf72oEVlEE+UDIpaUFKs
	g9GghgCK5MqXzqGAHhAd7GeoxveNmtnVjMt2x2jNG7cGQ3HIRsZbGyK8uhWmIzZzOXPMTjL3nev
	OTCpMdbArhXLnTokBZyd0mRdLQMb5ydgmokbR1LWgKqEafAb3SqNn/iIBmpoffsKs+qtgtIqPbW
	tlqzQdJbP6G0dQ1Uin57/tpfLVwvZD2kU7g+5UN4ddXIfW7ZSnMRYXsIG92RnTHjtVt2vaA9FME
	hBWj9qc/++jOglaGNwEaI/GO
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c05mr17294643eec.5.1795455069173;
        Mon, 23 Nov 2026 09:31:09 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm35807993eec.7.2026.11.23.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:31:08 -0800 (PST)
Date: Mon, 23 Nov 2026 09:29:52 -0800
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
Subject: Re: [PATCH net-next v6 5/7] net: kunit: attach net_iov frags to
 target skbs in unreadable tests
Message-ID: <awR4ELW3UKFzr4IA@devvm16445.scu0.facebook.com>
References: <20261120201408.3445445-1-almasrymina@google.com>
 <20261120201408.3445445-6-almasrymina@google.com>
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
In-Reply-To: <20261120201408.3445445-6-almasrymina@google.com>

On 11/20, Mina Almasry wrote:
> In netmem_ref_test_net_iov(), the target skb passed to skb_shift() has
> no fragments and unreadable == 0 while shifting from an unreadable
> net_iov skb. In netmem_ref_test_try_coalesce(), subtest 3 manually sets
> to->unreadable = 1 on a linear skb with nr_frags == 0, which cannot
> occur in real code where skb->unreadable tracks unreadable fragments.
> 
> Give both target skbs an initial net_iov fragment from the same binding
> before shifting or coalescing so the tests remain valid once memory
> provider compatibility is enforced across skb_shift() and
> skb_try_coalesce().
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
