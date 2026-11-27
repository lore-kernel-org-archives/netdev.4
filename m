Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795808;
	b=DSjb5I5+x4k/44ytF8cqJ5W2zcGP9+g9Xj0SMOXKlu1MzMeBC6MIFPyRMgF8FqweQx1/
	 FNabSAlSw62qMKWgEYgXzvJpQdHQoCC8YlkmGWNgXYhQri/JhRRGLPWIaKBIchkvnqIDZ
	 8nVXb9vSUWfJSuo2+IOP+8IP+JF3p5nON75NYRLIpZCOCbqqxJm39Q3zHGbhjo4qqn+ZQ
	 Tf9Sl9JIyrkUfn14V0Qnkfp4SBwWfoMLk08Kq3Lj0QfJkIoe8JoyGHWpdLgGd6i3NNvF4
	 PHFsW0m2f50oQeYT3jU+6aHFsMLQ6M8WBtRzV8WAMdXCpme5ynHCq1cr5lPbl+0ytTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795808;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=k+w8o7xwzGV9Gg+OUOyIqppnynU0G2SYi9C0Gx4/1kk=;
	b=4dY/he7eTp9GFbnB4kvtE6f4g17Vzl1gI8Djdcx0ynKwoR7gGDxZu9+YmO2DnYAHRN8o
	 y9p4Mm7VI0D9rR6oN9LnqIKQHy543WNq98zoNkYg0nhbpB5aMv4F56WJ9p9zNnwnK6z/F
	 6eLnmaNyGBJG7yzQOI5sBFNizmcdFR8vvgLIJ9dvNCf8ghBtmdFmCk8Lu9yBrgUGCWOdd
	 iwCjcvGhgOyA+dCWCFARdGNU9D0I/L6pCnWi2XDxpFeZ8HMVjlP3TrxeuwB5S1gMn/HQt
	 dIoqXtjv5UuBNuQY98QiOjzwRQBmu52SX/dEikqtPy3HWiH1u8RaCmb/fVpR19acuwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmzpuhNW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115C606A69A
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmzpuhNW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028721F00927;
	Fri, 27 Nov 2026 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795808;
	bh=k+w8o7xwzGV9Gg+OUOyIqppnynU0G2SYi9C0Gx4/1kk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NmzpuhNWOt0WZvg6OBx1fu6C10AZvH8d4f82usX7M1Hnu+9Vrft55wuUUt4OTUjx4
	 hGsqmBryH/9pfEqSLQ0UpD4b0UzhX2WTrFpmyfRs6yCu7xEvs3qdc3wIW6YRo0sPtP
	 ey23zAblExLCgGYMvonZ+1dwProt6lQcwsjyj9fZllCCarWce3TwJ+QA/X2AYHqkd8
	 f5J7XrpfF/IVBisYDXrkqpKzY32ZOfNK0cvNqeRkmPGsV/wFfzZs6DhYPtJ0xR3sbt
	 4wF0ZZ05nkzwZW7M5aLrmK92DjCvRK/YZYzXt8s0TX977blVenxlQ3wFVpmYv85PxY
	 XP3MqKFWJtyzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7323927043;
	Fri, 27 Nov 2026 16:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH iproute2] names: terminate the name returned by
 id_to_name()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179579580649.1564141.456800298049622891.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2026 16:10:06 +0000
References: <20261125164721.1942828-1-stephen@networkplumber.org>
In-Reply-To: <20261125164721.1942828-1-stephen@networkplumber.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org

Hello:

This patch was applied to iproute2/iproute2.git (main)
by Stephen Hemminger <stephen@networkplumber.org>:

On Wed, 25 Nov 2026 08:47:21 -0800 you wrote:
> strncpy() does not terminate when the source is as long as the limit,
> and the tc class name from tc_cls may be up to NAME_MAX_LEN while the
> caller's buffer is IDNAME_MAX. A name of 256 characters or more filled
> the buffer with no room for the NUL, so the snprintf() that formats it
> read past the end.
> 
> Use strlcpy(), which always terminates.
> 
> [...]

Here is the summary with links:
  - [iproute2] names: terminate the name returned by id_to_name()
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=35033e4713fe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


