Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621208;
	b=AhhmL+WMZg9iSuTk12ELbzNvmxMvAdvv6dAGKvJKB1c1qAw5zglgq5Ak4twewbOCBadn
	 E4njRFUilccqVfwqH2t89y6vNm/jqLEd0rBmdyy+yEspST5yPf7p7tP5JDLXBpyjg+NKn
	 csOQmzHHrdupTxnmib+xGESAvu7xgi10tHMy7cbhpsLcpiDOJ0dG0VGjojTPQ3jg8NK7w
	 v64SJ1rcYdjdee76xT4CpibICsCDHawUlODOSrxySB4OeTU5gOYJ0yhpM6ik0hqLlY5Dr
	 x1R/2kgY4g1CmfIG76ZkviOW24lDtYdjiBarhJOup147wxtvzflXUK4h+jd9Bg+3TzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621208;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=rZFRJL5kVKliHOnl8sCtkBdu6gxnExzjTCGGWXjS1h4=;
	b=oEOGZOUhr1QL1dwuWj3P3VX8fz904ksC5/NexQP1I8Si8dDDcwes6Dwdyvpmw7AnhOSv
	 jy8cKfcCl/dx9FpUml9WLVXrjirHHykBFtIXTjWiqzyjBsz4ezP4H/WOk9FmyCUCp+7Hg
	 bzfseyby06lKLVnoqqtnqtMp9LP2ZgG2rG7haiFh9Z8fbR96EYtCF7WAak3/mLYGB2IfU
	 L7V/FkkfbzmRh6LDevg324FvCpWv8Qo/GEy7AgZo9Y4t0DN5OohspsZuCFLI50LvmYoKN
	 dvq+AtzfWVd5a0IIE/h77lbWiYHbgXr3FWXlGY7AstqpRZ1OBErFOX0qdkJD87PgErw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLDjGTNw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CCB60A3837;
	Wed, 25 Nov 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLDjGTNw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBA31F0156F;
	Wed, 25 Nov 2026 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621208;
	bh=rZFRJL5kVKliHOnl8sCtkBdu6gxnExzjTCGGWXjS1h4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eLDjGTNwPVrJ3qp1KOrfGbirXKm0hhgNBxjIZ4QgfEEpOoNNACwkAQNB7NiuAD730
	 mXpqvyhV79IJmR0IvR7NE+y1+2w5O5mbWXnvAvotFTMq34sxR6FFy/1MosoMR7mAlZ
	 F4FXNKZQclI1bgff5f7dComaNiI9spUc5Tcq7WQ0p5WpkFdeDd8pkCVbFzBy1CZKvQ
	 BunIf2ld+y7ik5YZdaH2gjcs1RFCUEsdGFaS82T4eEl1fBuWJpim7+zu4l1QADIcJ5
	 /QBlN7egHy8a+5mUqOHrol0YQbrAOGcyhJbm2qXJmwrpWSQCE5ArxNc7/ZN/5j8AN3
	 ZWZsDfj2hnHmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14C33808209;
	Wed, 25 Nov 2026 15:40:07 +0000 (UTC)
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
Subject: Re: [PATCH net] tipc: zero the pad bytes between bundled messages
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179562120652.634550.3126259951173537423.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 15:40:06 +0000
References: <20261119184127.24931-1-astellman@stellman-greene.com>
In-Reply-To: <20261119184127.24931-1-astellman@stellman-greene.com>
To: Andrew Stellman <astellman@stellman-greene.com>
Cc: jmaloy@redhat.com, tung.quang.nguyen@est.tech, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 13:41:27 -0500 you wrote:
> tipc_msg_bundle() places each message in a bundle at a 4-byte aligned
> offset. It extends the bundle with skb_put() to cover both the padding
> and the message, but copies only the message, so the 0 to 3 pad bytes
> before it keep whatever was in the skb's tailroom, and they are sent to
> the peer node.
> 
> Zero the pad bytes. Commit 81c600c26302 ("tipc: Dont send random pad
> bytes in RESET/ACTIVATE messages") fixed the same kind of leak in link
> protocol messages.
> 
> [...]

Here is the summary with links:
  - [net] tipc: zero the pad bytes between bundled messages
    https://git.kernel.org/netdev/net-next/c/504e306886ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


