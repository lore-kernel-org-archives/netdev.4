Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653130;
	b=iMCtDwzTp8RyMKlVc1lBtC6h4op4ugwoQnk0z431gr06PjN/h4nzUCm5xEU7rdWD/MND
	 5d49jFPBLjO89UAlgwmUzgiKSYG8AIhlkwFPQEDnUlNvu32/rljhAmZiUN7UTx05KcbU+
	 fvWnTH0Xw1gQvdJJqhZ+xs5LQ0whIBslBAaWHyn6/VAvLQqgrdzjO/u1zvoxUtF+AziGF
	 9T0I6RKbJceKmJHegUMn1OsM6zzsi2bvmagWtuh7tU06AEzgVyOLy/QKWpsHjS3ZPbe1H
	 /enfmr2cNUbVchUMV7RJrTo0LzXUZt7vfMQ3Wh3aCUbQUOU9w0tmvH1UT/cWSlQjOXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653130;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=KdECWuzR8KuCsasFa0rYo2jk35Y/uO6PIbHfB2wAsxZdu9PLAGkATC+IaMi2RKC/0WS+
	 ZdDVOhpqv9+IMe23l+ZMi0QnbekHUXRXp3GFpuCfzEWxHQEnn1HusyL/qrib2e+1I4xVf
	 ForLGH6/hNe/t1o18K7wGMaOTwBO+ArhacyRIZgHtuRLXUbvNvYwlGVyB70x1pozm9MJU
	 p3vNh2eAZDsMLar5MaCotB2y67Gq/uVFmcO9wpW9E4OlkMTY3HGH7QG46qQw9zS7APP+l
	 87gD6bAj0Sf5CrrU3s9cVC971WxpGGhRx1V2sbgX4fAeE/mcpvUBvRsxE1o+7Yqa2IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RDRlU6Ki;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA6606A31E;
	Thu, 26 Nov 2026 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RDRlU6Ki
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0101F000C4;
	Thu, 26 Nov 2026 00:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653129;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RDRlU6Ki3B4cPuLWYCRwuIOX3Jo60p4cFVIFM2TwW36yBTFnhsKhr6E456Ce7k/9o
	 9J9yb/JJaOGKQUo8X5hWoYR3ASnUgo/Q0QBngabDwKNVuZ+dM8XGxHKSiSdePVrDkV
	 fC4Rj2ijs7kpa3N/WUHplpUIgleuXktSCftbsBjVbqtaHKZTWqD3ZtrLG4dALiupMg
	 tth5ZtLmRBRpb3Ocdd3yOw8wa+BCebyP9lT1TZFc3ghgmpTxtQHBiN2dicURWnnBjr
	 pYQ4tXgq77UEWBLu/kNb32Atlrri6L9g4YFrD7O46NNsmH1hWDhVMWXFXn9R8/n49U
	 RdhIwGlLYq8Qg==
From: netdev-bot+sinfo@kernel.org
To: Tom <tomasbortoli@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>,
 dsahern@kernel.org, eric.dumazet@gmail.com, kuba@kernel.org,
 willemdebruijn.kernel@gmail.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] udp: don't apply socketless ICMP PMTU/redirect
 updates on end hosts
Date: Thu, 26 Nov 2026 00:32:08 +0000
Message-ID: <179565312892.3294.7644425039287858356@kernel.org>
In-Reply-To:
 <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
References:
 <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
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
