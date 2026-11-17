Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885472;
	b=JvEXjOSLXvWO++LYmDPbP9jHOyg8wcmdZzjZaXRjEfmU+8sDjPseBgngGEllAtDz6oPY
	 aPKSPncxf5wQBCrzESmgGnjATfDzubzeL415xU+gCmfr/JK1JtFlbAyg8b4N8C4ynD7Ni
	 uj3WLmJQYsjIojLQt8DQVSXh/umrYANF2GU7SADrHrAP2HeLo0/ZYOyOp/YwZTfH3eAzI
	 froLac5fNXBkmY44ZDHc0jT+RWYaqMK1JvPr6nPbTLT25wR9xTMU6fGik4KWWL6hjwZU7
	 PM8cvIYPJASDx1EnBemUPbR0UcuEm9c4fAu8GO8eH8EBQZDHtRU7imlc7IkJH/rr1fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885472;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HUCPUyp8KQmljhwowjCzjgrc4MgHO5eex4+0LmhBhEQ=;
	b=uLreFGNoT5J6PbpfeGPRcbues+8pKafxVi4PjStxCQ2noCKCVu0fgVC6+svPD/UAicZi
	 i/YIzVdCkDmvo8NBbPH1DaU48jaUf+t7ib+Ux+iN1fzBMSKOlcAP7zRU21IAg3r+qPCtc
	 CB8yfXTkZq9tjPhb1jGrl2BBidMbEi/PGd/eXVlDsTZC1GlrzLKDz+WUemC2He3JdWLq4
	 Xn2LKR0p+Ikse0p7guHS7eVEHImNftxKM+zPnd4ih7sfV3j6rBofDY1O/BB97oGarFgWS
	 zcLpvmEIKTkrp26LjN9jDyCgUJwfIPBQazIh6neMfx9pP4nPxb04xeAgkWNkqvs6FLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwoLJCyz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E126606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwoLJCyz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E651F000C4;
	Tue, 17 Nov 2026 03:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794885471;
	bh=HUCPUyp8KQmljhwowjCzjgrc4MgHO5eex4+0LmhBhEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IwoLJCyzJ/8curzKq6BH/it4s98sbRMwkMVTaaECJpmi5u5yhNVFdAyCONxjdJCjC
	 19t42GTYCFaRfttaSMWdeDlLYXoxwz0BKU1pcpDf3k4bVRlSUZQftdgg4DmtqHqaLH
	 aVszcnz/33xBXtFO26nU/0v9myz4JR+NXQG52i/2LgXgoCU3fDtQ8Hl/ssKahfLxzQ
	 3fHRXxnN4LOtkXbYXEv5ae1X8IAUuP+3YzlcJYGh24Lcg9xtTUmio1Rjt5CjamOYUc
	 xOYTTXv93XLFsj4LhxDsjcvkYYIkLOfS/ulypxYtn9Yljn4CsElzea690pQCJNtIfR
	 a/ZzUKzSGDEow==
Date: Mon, 16 Nov 2026 19:17:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Paolo Abeni
 <pabeni@redhat.com>, Kuniyuki Iwashima <kuniyu@google.com>, Neal Cardwell
 <ncardwell@google.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/5] tcp: better visibility when receive queues
 are full
Message-ID: <20261116191750.6e5bf31c@kernel.org>
In-Reply-To: <20261114155150.235743-1-edumazet@kernel.org>
References: <20261114155150.235743-1-edumazet@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 16:51:45 +0100 Eric Dumazet wrote:
> When a TCP socket can not queue an incoming packet, it is currently
> hard to tell why, and how often the stack had to work to make room.

Very nice, no more kprobing needed..
I took the liberty of removing __sk_mem_raise_allocated()
when applying, it was left with no callers.
