Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459005;
	b=QhEeot1I7gCXQPj1oOprd3V83fIkFw0cnPNzcGbuL9xce7MxGz6l+fb6NC+18LFdixg/
	 8hFpsvTxg5ck3doHvw1c/QOs15pgcYhvtofDBiu3lHS9x+YZ2k5Osmen6+i4fR2fW42k7
	 7rShAWxaJNX3oda4hhSfmM646p5LYtn/+zE1mtX8Mxo4vZ2C26xZN2EeL+rASwnjIsE32
	 efKHekVtSb6CI9M7boqKkSQAFNUGaYIuM2kbz0ZwzI7Hh1anQJNP6V3Q1fIgZ1cSjtMCo
	 ecLlfkWMt0j2Jp1y+V1BMaRoUTUcib8XXFSCqn6oNJjkfjfiI/odPlGhPIPr8HWbN2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459005;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7r7GnRZECH1M6EHRn/jHaAV4CIG5khxbrEbhVI2U8g0=;
	b=AG3FFLvM+7qhshyEM2nBUeri5ZR69WGSrUZ+ZdNcOa/EVJlhkW9GPwvc2iDdcxiTEHwB
	 67jlT0qI5fYm/IuKAlNCrKIUpaWH4kpUm9jEN8pmoKqzX71GjcC8QNoVoIHMFKoozw9rz
	 zIdXUkQHakqMqMuRpFsO6ae4mEpi2NHaTfsVZT9f5fzHAMRMrqVC0K5g2tM54rCINyHtE
	 l+vjw/SVIF3Tpe0Hvgm0j3sw6GfPrrUZv98iznXJ1R6Wj2lPZFwMsrlKPfmOCIiQrNL45
	 yQZiB3/AmA9tWBI8TAohbb+NUnmuBgKeXE1n6bM/71jq32oU9TxxC3/1Wum1i/YpHbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaAVT1Jn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC5606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaAVT1Jn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014DE1F000C0;
	Mon, 23 Nov 2026 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459005;
	bh=7r7GnRZECH1M6EHRn/jHaAV4CIG5khxbrEbhVI2U8g0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UaAVT1JnsQUx9xfuaMVRnBZGJjojY+KgMuXO0OOa2DjLNfov8JgfZIlCVoUTrSpcW
	 k2ApTDZFmoSJ33mI9Nt1vy6OBJzrG5phXMOLykCUBSQconR/RCq7ViPZ0en3GASkHe
	 S79Jf0atu0Kyett+ghwpmlkpsSoKCZZtwIXQtk2fAsaBqfn8X49PLx5N8kX+7aaCih
	 kXEPDlaqslXVbl9+vyZfWTtEHLpZJ1DIZ3xC+6LDuaWYrJmxEJFBv4MkQb2hhx1SRI
	 TU5tvlT99JscmohamA9s45FubgnJBtFo/U0IWFEhuPPP7WwwYWi8+0vZ6jlXdf2gkQ
	 s+9pGg68R0bZQ==
Message-ID: <2354d63e-1ba5-4655-8cea-2918fa0ee51f@kernel.org>
Date: Mon, 23 Nov 2026 11:36:43 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC net-next 0/6] ipv6: validate dsts against the netns route
 generation
Content-Language: en-US
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org, David Ahern <dahern@nvidia.com>,
 Ido Schimmel <idosch@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
References: <20261122222717.126333-1-dsahern@kernel.org>
 <20261122222717.126333-2-dsahern@kernel.org>
 <a31eccac-79fb-4fcd-81ea-243592f20c58@kernel.org>
 <20261123123800.406950-1-ralf@mandelbit.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261123123800.406950-1-ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/26 5:38 AM, Ralf Lici wrote:
> On Sun, 22 Nov 2026 15:30:29 -0700, David Ahern <dsahern@kernel.org> wrote:
>> Ralf: This aligns with the direction I meant in my reply on October 13.
>>
> 
> I see, but the concerns from my October 20 reply [1] still hold. There I
> noted that a stamp stored in the dst would have to stay immutable, and
> that reusable per-CPU and exception dsts would have to be replaced when
> the generation changes, rather than updated. That is the problem I
> describe in my reply to the cover letter.
> 
> For anyone following this, the analysis of the race and the series
> addressing it, now at v4, are in [2] and [3]. I would have welcomed an
> answer to my October 20 question before a second series for the same
> problem, but now that both are on the list, how would you like to
> proceed?

My goal here is to better align ipv6 dst handling with ipv4 and not grow
apis for the validation in some parts of the stack or expose internal
details outside of the routing layer.

That said, I have very limited time to work on a proposal. If this set
cannot converge on an acceptable solution in a few days, then I will
have to move on.
