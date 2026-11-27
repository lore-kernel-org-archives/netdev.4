Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784295;
	b=Qa8q/qg0jE2hZexIUID9rhIvRG4WJzCdAqmXpO9lb32ImHxCcWq5UFJ4aomIrWQUWyRn
	 z3H8nrIA4fKKGiHcED282exZK2Nnp/sRbd8WSUboSiMertoNtsqj/KxmkFTnwBU7at7KW
	 0U18wga9PFZZw06y4NES5R5etvUP57x1JastHuN0dShQ6YiaJKEqL1cHZCJ0PNu2LQ+vi
	 h4oFBnS+23J4gMt06o/1UIwlYuw5pQ5ayQONBDunEF5wB/LVloB52pCuE2o2qizO8CP6i
	 0rdV7udQUgEdOCA5w3z+qQ7wRbixoESfIUwG4915zhvsHyVxa4xIKiDEg6xG5Ha4Hpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784295;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=Qc2dKwTCe0qCuZ/GFtJpM9GMnzL3WK8EXP9Z6A8yaD0aG0OHAnVGgaWBawPSxERAhleU
	 uSfFt0kOHodnv/LhbH/Gr805P9XqWHeS743UwW6SyIxKhUjASafzsWcIv8yv3nyTGqzhL
	 dp6Q5SC4wm9RtS25fjxYYxdzalsMqcpLOcrThTfC6Ppw/adKTJb9euSF06lVljQC/rwXe
	 JK0f4VkcdfvhiZ9Mcc8aBwPDCzPUxh1uUFb46tnJr8qjKl2ic8dwQIjtH5rhYy3duG/A8
	 G/SUuoOl3rpqN7tDMf4S2BsCI+tth/m6aYiwwZoZpTvQaxtiCCnAoxwUqmI6OV9Y06Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxJG2fzm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0308606A321;
	Fri, 27 Nov 2026 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxJG2fzm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B531F0089B;
	Fri, 27 Nov 2026 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795784295;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QxJG2fzmE/0UFgznrtB0PZPyvJbbr8j2gpKhL0w8HGZos2weGLkrd5RM9OzzexT8W
	 gyx8KNw53KFjiF645qRwXGrlrGFArBHp0d39+/enZ1m6NQv9+76klOSnAbasqb8vQn
	 988yNKsSH0H40WB7KpiqyeOlZSQDVs3nDx2bvV2hMDXD5DTndiy/2/y5mmkbOnOTrp
	 Ub462oXyHOxOhU/HSS6u4y4/bEw8jKYi/za3b0ThN02LJ6OBPaMkyhgVnkDIL51fMY
	 8zM0lZQw146GNWDtM4cGuPnQ7JZeSiJUH5pcUFl31P1MO0eLIXPivoWgARQlWXhy17
	 3Jgu1Yi20mH+Q==
From: netdev-bot+sinfo@kernel.org
To: Bilal Hashim <AeeSec@126.com>
Cc: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rxrpc: rxgk: round up appdata and authx lengths in
 rxgk_construct_response()
Date: Fri, 27 Nov 2026 12:58:14 +0000
Message-ID: <179578429429.3294.3941627072107060437@kernel.org>
In-Reply-To: <20261127125250.1434-1-AeeSec@126.com>
References: <20261127125250.1434-1-AeeSec@126.com>
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

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
