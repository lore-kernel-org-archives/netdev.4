Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546962;
	b=gk9y2olk08BpOyi0gW/iXydRL9f+eVuz9vP2uoe2r3QMVVGRy+oNYmiaZdLRUXGDzzbC
	 8KAKHmAozp2AS8GjjTQLnkI1hD42lI3LGitkiWN3tqYWulDYF9m3UF3PKY9EiatQsomxI
	 uHmbOHao5JU3jG6E77Zstbsu2aRFdHpgtMy9ProPldugW03Xz4dHcWSIenWRQyzyABeeO
	 OJEDFWj0ngrOmwXhmqeijMUmTHD+mne8a0EXD4S6NqyoCR4sRJnxRKefgQkvmCX32EHwu
	 Is5/OIMZIXz18ZYtZoHtb7cqAJ1RU525TTCcgyl02btIg6frqaEmWPZthRItr5mTcAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546962;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=XJ410YYDaH+6V31E9Zw5+klb0uYjNSQL8EGH7kR7xtvKYQEKXWwfWDt7J1VHpCJXzkiA
	 57b4tooolkZXo1gbsDUGiq9N2Z/wFodc0YF4vVKwTi926Z823piMm4wLSaPNDmIDbfIGM
	 hZ6NK09p+qtGET37WcT5zsqSjtXS8g1idhvAtWjLtsp79YJ2fxyo5b31EYc8GohTLufix
	 4gI7SW8z7xKH5k1Tr+LIH4q/BHXsKtKqMIM9SYg2YyNVUFVAlhfUgo7/Zqx1yDRyL032U
	 7ZLXFSFesTyoU79kXWXfPuvVYnaUu094PukDli4R4G03aeIdmjfF5p48rc/EJRlfGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNLQJuLi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B8606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNLQJuLi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934B81F000EB;
	Tue, 24 Nov 2026 19:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795546956;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VNLQJuLiZe1ix2tK2ccvSgMQJYEr4iwv5zwOdY+PJQTeYpGNQ/T0K2qL1fiillzEv
	 NKOEwg7nvOvHEVkY9LJVcpcMkCa7ylaKvQsvOjY6GcUF5RHbkKW+jTuEf/oPBQhB7B
	 foOAa9Zoi98/6mI+nn0naJW3o3aDmGnoGCIAXY5+xIJWVw6QB3Iy6XpN2t2ExGOMOz
	 YMdZF0pzO4ocM0Gm7KnAqqYaeUM2obx1K4Yz/RwR0xmVmR8P++3A7jjs6RhTX8iWL7
	 FFW4g2Zwyl8gSSeQBEGybRDtFJvCRbpOUuGT6FKjqHlh6Cki/pQ5BSiF9anpGfCGv+
	 SSBxtSQ86BBsA==
From: netdev-bot+sinfo@kernel.org
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Hariprasad Kelam <hkelam@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net] octeontx2-pf: QOS: Don't free SQ memory if disabling
 the SQ fails
Date: Tue, 24 Nov 2026 19:02:35 +0000
Message-ID: <179554695507.3294.12556195566156443962@kernel.org>
In-Reply-To: <20261124190046.415260-2-oss.patchbox@gmail.com>
References: <20261124190046.415260-2-oss.patchbox@gmail.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
