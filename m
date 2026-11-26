Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681334;
	b=a10J2Cqt7uhQc7V6hOI9aiQy+uOxj7LUCxDLCkxdlk/ZtOYPoALezJhVpwjW7BjYfSIZ
	 893BoKXWED+a+GIAf0/n+S2xlOpClsUwaZTz0VnqCs98mHSrIakaHEBF4AC8xbwI9CUNL
	 fO2zhsNWrt6ygOdpAqqh6t3D5Uod8rWjm5mAAyM6tiGH+jMJTu4kDEsXYNVXaiI0k2sfL
	 C6cXoAKsanwp3T69jdZPVxaklJB7RrVNr6780Z0Wd+hIBu41JOi9QnblU78/rzxpsmwZ9
	 7S1D6Kx5SjgUPnetg3Os2GOUrepacqd43PoV5lNUGSfCyoWKDwyHK4Sf7D8XEd4uzwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681334;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=nveTzayoVja9jeKUYs5LGhVocVxskr4hjSwCwf2KLX0=;
	b=khSa58DT+2DurPOmZdTzwS4n8vMr3loTwgbjFTM03/VGJyd6HEtBVlH0dmM2uW92jIuZ
	 qdLzViB4HMtmHe1V7dYhvJlFKqviJtJgA1EZKOXHpaMOVA6YzHaBzSjau9fNtF/T3H6aE
	 CrGPlGmbFBYPwCtBlCXJCLO810qnl8rTGdfQAwrOIX4+Bje38pGGeHzT2AWQ1Z13Wm9h5
	 MVIjJL2FzRJ/g9rA3B5ItMlsEXIGBD9fMcrgAcyThcRC4hdmz/Dfmv95Uq6URGapfaMbd
	 rau8LsojnbBMAF8l+TZLy7PBQ37C7Kl4z1PQZNtmcZLj2JMMG/bxb8SOx1VH8f4Owiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=qVN9cKeJ;
	arc=none smtp.remote-ip=195.10.208.55
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4638606A69A;
	Thu, 26 Nov 2026 08:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4638606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=qVN9cKeJ
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4jZqK74hPXzNlRF;
	Thu, 26 Nov 2026 09:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795681323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nveTzayoVja9jeKUYs5LGhVocVxskr4hjSwCwf2KLX0=;
	b=qVN9cKeJpPwfeJWeXw6D6Uuk/pEPTUszd/bt49k6TgE6PSgtKFRwpqNZe8EieLXbgaBIw3
	BCgmBZz+APWJI5t24GglKMlhtuV5J2tDY1Avrk1jmOg7XdhcZdb043MOxy/nTSyx9J+3HK
	AoX3pBlhyOjOlv3qTs3g4AHaxWP2Jqagka+FcprLuShWRS655kUktbYJ6pTsrbiPzuvfBD
	Z3zJNNO5vXfOh6RmR63hnh43laIJjDi/oH8ijo79zp37xkkZTqWjnGxKuFGubyn3Vb5eW1
	OoHEqRBYfy8Nu0D2eRg+ADqx0u/Nwkwa7S28jKuc/ISFhykW6TbJMdCQUkzMcQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/4] ipv6: tie dst validation to the lookup that returned the dst
Date: Thu, 26 Nov 2026 09:21:49 +0100
Message-ID: <20261126082152.64520-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795537128.git.ralf@mandelbit.com>
References: <cover.1795537128.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jZqK74hPXzNlRF

I'm withdrawing this series in favour of David's "ipv6: validate cached
dsts against the netns route generation" [1]. The fib6_ifup and
fib6_ifdown ordering fix (2/4) is posted to net separately [2].

[1] https://lore.kernel.org/netdev/cover.1795642432.git.dahern@nvidia.com/
[2] https://lore.kernel.org/all/20261126081353.55240-1-ralf@mandelbit.com/

Thanks!

pw-bot: cr

-- 
Ralf Lici
Mandelbit Srl
