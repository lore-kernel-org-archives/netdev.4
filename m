Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160442;
	b=Wik8jag9Xbsw+dcy14OxSinWo69IiFcAizR62a9dqS+EeOGmRg6nzxSrfXMSWqlVO5X1
	 5bRnJ/L9v5DVcpqod2Kq6Sg513ZbMNMrfjUlXaHVrlVtLUUOq5dbPJfjrTrH1uEhNeRiP
	 KifkfAjJe2j4UhpiOt6T5WUV3/792+YarQj4Mi3y2lKgHegHZuIXzc2tUkCdrK1n/Jeom
	 828Dpf0cGmp5a/TBeha+Rux99mqco5vLnGKcrZWGgrfTEkY2cT3Vnz8qoiRQGJTJzGpyQ
	 Om58/xb9Bf1A9s5DY05gV6+6+6Ar6YMfUvsUx43aGaOlbtP1zCZgCewdRiZHqHY5Izg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160442;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9zANKx3X6/4PBBAjKGxTe6yrbtSc2LzFytCT+1znbgA=;
	b=KHoHTA+vgM1ToMU/Ix/djXseM/yZN3eT1tDXJvCc0sjh0Md+QBX0IxUYFf59hfBttbd+
	 BUjwvZGI91+eyyppo8IPMCNvh7TCy8fuXfoZrlNktIb//NbTRJtcvVOWgovRC8cPEfxOJ
	 1M7jFdqV8MZ4gQakuEqzAaPI2pgEaZdAHqwY96zKCN526hQ958mzJ1j/iMRgLgWLTVrvj
	 PKvkMaW7ab5LNJPO17goY+RP8P0QbARQ2JCciGh+97Hxf6fk1TW1sQj6XnuGrzJ7cHEib
	 YTTlzt0im81wtGaie0kfaVXBVRorRJTUCwJ7jNgWunAjl7uQhoLFqFKRYc86ERQ/i0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=SaKVW4Un;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB27B606A320;
	Fri, 20 Nov 2026 07:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB27B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=SaKVW4Un
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=SaKVW4UnsqXlhJy/uMvJvRSi200Q1oJ4Pjt2AObbmxlUMNZxLeU1uKHQudVfw2sL5C3PNfFUD8yJT
	 tG90UMMDGjtQoDdKZdqBK8ZexvVGi3AfXoWNxmJZpTdwraY8Sps71h6knteaJ0Cz24dGq81c4p4Rny
	 PNf9wGpBga3s9ks8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afff9757aa-f2ae2;
	Fri, 20 Nov 2026 15:40:38 +0800 (CST)
X-RM-TRANSID:2ee66afff9757aa-f2ae2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03.03 (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afff95b8f5-1b7e1;
	Fri, 20 Nov 2026 15:40:38 +0800 (CST)
X-RM-TRANSID:2ee16afff95b8f5-1b7e1
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	almasrymina@google.com,
	daniel@iogearbox.net,
	willemb@google.com,
	willemdebruijn.kernel@gmail.com,
	mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	narcisav.kernel@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] net: add a KUnit test for the alloc_skb_with_frags() tail split
Date: Fri, 20 Nov 2026 16:40:08 +0900
Message-ID: <20261120074009.183870-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179510021881.3136.3672843529450562064@kernel.org>
References: <20261116115620.18151-3-yanhaishuang@cmss.chinamobile.com> <179510021881.3136.3672843529450562064@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 19, 2026 at 02:56:58PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Can this report a FAIL when alloc_skb_with_frags() only ran into a
> temporary shortage of high-order pages?
[...]
> Would it be more robust to call alloc_skb_with_frags() again when the
> probe succeeds, and fail only if the second call also returns NULL?

I don't think this is a practical problem, so I'd like to keep the test
as it is.

The probe asks for the same thing the failed call needed: MAX_SKB_FRAGS
- 1 order-3 pages held at once, with the same GFP_KERNEL | __GFP_NORETRY
flags as the retry in patch 1. To get a false FAIL, that call has to
miss an order-3 page and the probe right after it has to get all of
them. The pages freed by the failed call cover only the chunks it had
already allocated; the probe still has to get the one that just failed,
the same way.

Calling alloc_skb_with_frags() again would not remove this either: the
second call can hit the same shortage, it only moves the window.

On the -ENOBUFS point: err is the same for both cases on purpose; the
probe is what tells them apart. Without patch 1 the call fails with
plenty of free order-3 pages, the probe succeeds, and the test fails
(err -105), which is the case it is there for.

If the maintainers would rather have the retry, I can add it in a
respin.


