Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938270;
	b=16whEVAdMRc69/ilhLcyaomKlIHUb33bbOvKKdB9RXbuDQQD7Wab7lrv5P7GV2u9YEp8
	 wG6BhykkoA3YyheqdRoxIldgrBFjK5aM1ZDGu4sTQvPuel8TlJFkgwLEdIb4LQUge/Ud8
	 UUfzeacadI+4NfmcaZB5PZQcV2qjCVqAK+S2xaU1wN4GFPDQV7Z60z3l2HAthG2WhUT3i
	 Exrz/RwHy/jsljwk3q6i55qFC0HSNGSmVYOL5nKYHVDy4D5DwvMinF3HndWfkyKfLbt/4
	 mtCS1j1CFDr/Zqp5kbAdkH17Tk3W3wXjI9isUgzc2Dr1Ktul5EilsPlvWpTsmMDxEcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938270;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CzegLbUsquqVtpOAinxNanyANEg0qEw7szKZZfc7AyM=;
	b=yCYCoJZSkwuZ7B/9qx8kiBbRAf6HMUXIhM4WksNZedKVvE1Nsdmxgr3OYw7wIB3qXOny
	 WYGBJaHE2HsDerVf/IIUP7jy8W90/I5GWcCyqh2ssGy4bAlcLgGIgY3+g2N2vn0y2PP4L
	 /0drRmWyQ6hhc5rjEsLfkBWFRp2P8L7PVUi5n4c4ppwpVI/OmoNst+ZAwW2gamFv6evUR
	 WGcke/KFcuLiAOP8Y4Eh9WmGkVqIp0zzKwwlvUfFjduEzc7JLDwPsEHfmkUfbxG1LhXYk
	 fuYxhB8iRTm19BJdbl4NaQyAwiSpn6+X2zyWPlgI0EbX2leyAdBtci6/HE7UkqfhidQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ER6QAmbE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F097606A31C;
	Tue, 17 Nov 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ER6QAmbE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975041F000C4;
	Tue, 17 Nov 2026 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794938270;
	bh=CzegLbUsquqVtpOAinxNanyANEg0qEw7szKZZfc7AyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ER6QAmbEbqIZulKFkdLjGSkF2xGxTe49RrBNX4/RFF+fQqBc1IqGS+T2GCHCot+Re
	 NcNbyXyz607vQupoy1KBb+jbgZfVoteryasURYEkAmB50lSM1uxHsBSLDKICWFGA8B
	 JeRBQIdDZ0y8n6CvG8JKbn9GfmTn1dmQ/+GQOwhtLnNoMZGGZRpPzrlM0uhggfJJCw
	 uHNtyZdhG8HCu1KX+5IXdO3zzxJbF8KEZ/fSsI4pFx/ePIUUdY//XeUDU4UX2gnmX9
	 NmDs1TxcvdgCShrNzSVK7UwKgn2e3jKCKNMxXx55Zl2uNO17ak76rxEsedjrBab/jj
	 NBCnjMwGSl7rA==
From: netdev-bot+sinfo@kernel.org
To: Coia Prant <coiaprant@gmail.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5] net: txgbe: fix stack size for PHY interface mask
Date: Tue, 17 Nov 2026 17:57:49 +0000
Message-ID: <179493826906.3291.8093424024771167710@kernel.org>
In-Reply-To: <20261117175528.3018609-1-coiaprant@gmail.com>
References: <20261117175528.3018609-1-coiaprant@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
