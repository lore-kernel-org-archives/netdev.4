Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106996;
	b=goQn5zkEA91wqBD7p9GSmX+33EENtM4F+EyNaXgGjIPQXZgHgibdo8gbTQhmy+5vyncH
	 9IvwxfZd063pUnChoKXyydArIaC64OcO7BN7ppTdWBHQ78NwnQpI1FaYWOkAFH5mwK9hW
	 qlaM4QLwcFiFtrbEaC7+gnz7lNad/fwnm3GUAKgQFWnjM9PCuZD6lQJCdR9usgk8FaFAn
	 jSS8EoUOtGijgj39MaHRYYIWqIwD4ZBhfos8zKWOX1z67zcgv6XmmZ0sHmhcuj1JD41CT
	 lLh1MIM0x8cwcZ9OjBTOx5GN7yPHOdbGvKh/YfN+vKeDLQzvB16QUHG50y6PNkQ3d1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106996;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=sqECVEBoOV5Mp+TgrPXqEBrBUbGuUztwwfmCyUYHd0o=;
	b=nroLG1bgHABG/UIuRgsBVU16vtrMOFkhfuO63BrKZY0Pfy6ccZufVMFPG7sWA5Sda+z0
	 zVC1xvvJyRVKHkYjZhJcYRZuoFrJW00oyP9Kc0Fqqi7XCpd8jmRKlfztOxwXS6IQaKBRs
	 Em9AEKCrOWKQNc24CFnwBEwHufHpTk3FhpdDrG+DHOUwr/DS1xaVRnaTypnMlWlLIZayy
	 ldVDrnYA8DA1s3ewQyzmb/45/g37AIFfudoCwnjkb8DLoPp0iInzMiYE7YA24CrO4EIoG
	 YlpSAypH5guynDUUipET8Ip4T1zwTxJg/b/+zIILvDumCZeGV3bzsbaz1G2hgvV3q/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFFoxDLw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F760A2631;
	Thu, 19 Nov 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFFoxDLw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0738B1F000CA;
	Thu, 19 Nov 2026 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106996;
	bh=sqECVEBoOV5Mp+TgrPXqEBrBUbGuUztwwfmCyUYHd0o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RFFoxDLwbym1bKjQMjPBq9462xOtYxtDL8R3wUsaapSBbpY79MDOidh5nI8rz2jrG
	 ENO2UTOtlIi8d2swRlJLawdZPaQZWJNIAjnPxVzh6gq9hC2jTbpvb6AXGRLFYTpwnP
	 qDOmvGwrCYfpfML9uh3fjv6io39frvENCfcMLPyhzMtYE4R9NFodtlAhSOXl8OxXaf
	 7sC9xdGZoPAFwvJVVbTF5eNTbzVMbcZxNQaQLAX3Qgyw40PBb99gbZvySJ8TmQ0hu+
	 FMkoH9SnpgwOeRP8QFqLqUsYf7GP9d0UJlTAx41GRmDvt0Pz5Les4rTnKWyaSGOiaC
	 kifO5Vslmospg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16A23808210;
	Thu, 19 Nov 2026 16:49:55 +0000 (UTC)
Subject: Re: [GIT PULL] Networking for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261119154606.144368-1-pabeni@redhat.com>
References: <20261119154606.144368-1-pabeni@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261119154606.144368-1-pabeni@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git net-7.4-rc4
X-PR-Tracked-Commit-Id: b10c986f1769287270de248548476f6dc2275d59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e575bda30acc0bf01f799cee798d4a1c100d538
Message-Id: <179510699448.3206305.6726728981448982869.pr-tracker-bot@kernel.org>
Date: Thu, 19 Nov 2026 16:49:54 +0000
To: Paolo Abeni <pabeni@redhat.com>
Cc: torvalds@linux-foundation.org, kuba@kernel.org, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 19 Nov 2026 16:46:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git net-7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e575bda30acc0bf01f799cee798d4a1c100d538

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
