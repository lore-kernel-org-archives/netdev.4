Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794659731;
	b=HFWl14ai2O4+/u27zy6pzVDWMUguGQU9ruecG4260tDFjI8act+6ByAvA3syR68A6zK8
	 VenK529n/fmQ9HJSySS5itnZN04l9eNWmNEo0E4Jcxke0TOIgBQxchQcJ3POSqYVI/8fT
	 I6uvroU7st8IlFuHJGVfIsd4aQ1sbRASrruvwfVhaznUuDlfPwnQ1cZH/39+5Xq61pLeK
	 iflOGvqsXqxMKVwDsGiR/MIibT7y1bbczBkN041nE+iQX6TCU0IGNmQ7puZmOarLZf2H6
	 psmUvBhpiYhVYyXksV9y1P1qEbQCa1C6ACO0pQbuSZAM9CBRnYVJAH8KEFmvuplioxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794659731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r/p2WSDDwlfZY2s5fg8yxPMJg5gzcfRu8Vq8eK0Izk8=;
	b=tSWYfC1YJoDG3UBJZiu7dQjEeEyMbEXsofVxm7QtwB+pkCkTIGeLEVc/Q8PB5MqkLrzF
	 lBVHYGZHY4rS1d6aus4yGJETdyliA5ZtE51oqtZcBl5tdhNRfQeB6N609ibXsE1fgnDz7
	 5Meuv1OROP+HTJMinSNTadGEvD3bY3Vm2uB1Zz6TnI2VNFaeEnTGdGgIOuov+2N45PZ+F
	 OjbXf0tR0Un5LKgmrIAk90CSKd/SMyr6CHHX/iO7ZI2hdtC4o1cbyCThHYLxmmOx5tH+J
	 Qtku0zCDVVZIjFfU3nqXEuhxhENyXEDY8wgOdxNQJAHptVmjwwlN3U8v+WHU2gCG5Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=hXv6Xwym;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD796606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD796606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=hXv6Xwym
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9496473b511so68717985a.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794659730; x=1795264530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/p2WSDDwlfZY2s5fg8yxPMJg5gzcfRu8Vq8eK0Izk8=;
        b=hXv6XwymXGceUlZL7WtVJXNSY2KLzR+5XuCCQRaOMligXzCYmtrC8D6aptBBlf3TwD
         8V0CleuJzCudM/1aOV9zIPC1XxuMBkAZSzIbmoxT5LxnBIV8NgrpcCg1yUy36XCyAL9W
         1sK+EVhwH8bk8s2tGGt74SZ/By3N0v53GZ0TPQEoqtSABq+sdkjex/3hyNymufZg6f98
         Thucq/GqHHZjYB3h0E5Msa49iaoDnugvQoWtHjwkKt9OY6WuK2Bq6sO5RVyTas5FPS6J
         e53rgl8t2/pzvVEh1yhCOScgscYP1KBvkVuaHx0E9UHqFZEFsu8hIdaqqxzOT3uhFM48
         ZbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794659730; x=1795264530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/p2WSDDwlfZY2s5fg8yxPMJg5gzcfRu8Vq8eK0Izk8=;
        b=YGO4YvYoQhJg5ISW/SQF6NucV2GwcWdwtyFppYRo4yKP7O7y6HjejjKZqgpAImyn8F
         yshIgrZTLGoiNlKCR+Zz9vQSaXgD5wFYa5DTOVpTI/F9m3MKL1txgTaS2PPat1sykMIV
         sfMuSX7cyYwIlj014dSLJbGnhPE0R6bvvaW2j24siMmI/UKryzNa7Xr5+XwcZAALoI73
         N+pEaS1OYK5fVYZl3eVcwRFGMH2EckfhKvzLUyjzTZt9H7AQfFK6M3W750SaHxizjvcm
         HAVW5TOuEWWjL5ji79jMeBsJOfnSVdkeEQXBBamHCsz4/WwO92HOmWaP2LcWjZ3cxjTc
         KKOg==
X-Forwarded-Encrypted: i=1; AL+hErFsmQcSWaDxoxlqqb5RcD2cRyIq4QAAkNIl3oisvzUwIV8au/j/Usm3OVlF9GzyvVJeaOr6z9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5hbayTdYI359D8auHjylh6HT6Pjhnar4EpvnZbiJwHpQTvMap
	Ad61qb41Qw1wFlhy2s1zgcLvxLKM05eR90kDmEPp6NoMv0+F6VUWVAlLzXhaPhjLGQ==
X-Gm-Gg: AYBFou3LrTQmfAKxqHUdyjUPNmUYgjKeeXWxslprUrJgZyW5NY2yi/vh8HT2jopELRs
	SVYVcC227QdvukrEeoPChdj7DJAKkdlFNEWoVcAiHlmJPBBqp/ca6lp1ALhF4suAGknNSEBszYc
	j+I6FNcHTnRZfuOfZGNyBEMA9gpsPeiEJpCTog11de7FT8zNmm0tzR7LIX4wcomulk5yyrv1x3y
	GENvD+gwjR39zrn7gWUxBqDE2QoibDS4vA6QJ61y+X8+aCAoJ38RShlvl2bMeVQk7vpisVXoba7
	axSkgwUFSzy305CvLS24UiqtJklZG/jhbTG+KtESWOXW+vE3/pG1Iz5MYGQyLSxWNhdHfzosh30
	3jW77oBwyJCAMOeWxiom1923mdzG+iPfDf7EgmBK378d5VLastYJIDfzBl9T3/NS/nduBu75BZq
	zTW0i33TzflMj7ZHEbOCDH1RxFmd052Y65CtUYV7QC+fFBHsNjPhsxTIVTIEsHZa2S8FhHNpjHp
	LHXlJAHMrQJHHovE8T4XlcMo9O5iEtH8Wp9vDaRcqfzsWNa3jvXepVdPGiituvETqmbKa+iQrW1
	xY7nmLlqH3UOBtdNZN8JCNjluqm97yCb4lrNeGrsehqbtSXSBgSw
X-Received: by 2002:a05:620a:4711:b0:949:6d95:f630 with SMTP id af79cd13be357-9496d96005emr75577985a.37.1794659729734;
        Sat, 14 Nov 2026 04:35:29 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm277233885a.6.2026.11.14.04.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:35:29 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ipv6: bring NLM_DONE out to a separate recv() in link and address dumps
Date: Sat, 14 Nov 2026 07:35:21 -0500
Message-ID: <20261114123521.452385-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113182633.1bff5ce5@kernel.org>
References: <20261113182633.1bff5ce5@kernel.org>
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

On Fri, 13 Nov 2026 18:26:33 -0800 Jakub Kicinski wrote:
> IDK. Maybe others will disagree but I feel like uAPI changes that
> happened (almost) 3 years ago are "settled". At this point just
> fix the user space.

Understood. Thanks for taking a look.

Hengyu
