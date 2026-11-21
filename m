Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795224012;
	b=DJXgQVU3ZczlJRXtpPjl65hInIUTEYKTEw64panNjbjQ9GRJjilbATNe3L3N0Al5EX6E
	 0opze3l6q/uvcsC5DRurrb9hZx3zWpUxq2z1AaX62sYSpBCkjoXq89PcCyeF2wcv+LlR9
	 JjRBcCvXQJqB7SxPbaarQ+mtRAvQeOS2GkH6csLQMHX5WYjzhfsin1jCyyJIanA3iqHrE
	 h/Am7jw8qL1CS85wkowi1z2w8IrtQQ2LTtX6qab6Qg513oePq9eTzwKIisb8TPfMlWg1d
	 2HSzcWuYO0Afe9PkVG7use0VR7SCphQGhFUXap5nUEvokEBWAutW5cL5LXu6uS2kOqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795224012;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=r+oIxWhyGPz2JARJQYxterEFNaP3XJclRaGriae8jbY=;
	b=KynSd4H0aoIklh0CR1XKc6nt27kf2sbTfEnHb2sO9h5gGC2E8jpNeemqEYbGMl8t2w7M
	 sT1CEq05jeujxmHCTAU4Ktb2yvnak5Ys64k6FluelqE9LMdArkOpamaFeYFgNKmo6Ho3V
	 80Z3Snl9XSMUPXl5jXCd/FGOncnG3il6uzK0AX6kA34pJqjdOANzlGNsSHiE9k21j1PuG
	 3avqvt+aL1bi6DCtlvtHhr/Ps5jGH5Mh2q4UTvmuDWrfhXxS+RVRYDx9k1zgEV7LpghKV
	 CpgFTbijz9uP2yS/UpW0BJzVAf1fLYQ3h7kwe0Kg4PEXpZTBLqViYcqL6cqP7YGx2DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Eb0/ZQZo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CC7606A33F
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eb0/ZQZo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08E21F000C4;
	Sat, 21 Nov 2026 01:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795224011;
	bh=r+oIxWhyGPz2JARJQYxterEFNaP3XJclRaGriae8jbY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Eb0/ZQZo5fwtw5op8iDzPWShehrloS/8KQttbMdJicH1zeogzqEG/6EnmfrczITUc
	 +8M+bzjGFr/F9g3AXysV9xG+JHhSokqU7Fn3qMGPWyFPjDqJBDPk0E4+0AlEqYz4/E
	 fUTyFeQAr1E38McanjjS8RVn6bJtLbalTj09PsKGVdtCbvcLxW8alpju36tS0TaWJJ
	 /8lAMQsDGTBdY7CiYVTMNMTpiIrW+CL2axxlL63HcuVodZyVBiJkdV9dQU4DRDtjEE
	 ddqBkSoj8rT0Zf8qZuuqJqEhLwh5TfAZNCzJdWBlnd3qEQ8WEEXt1Ajc0pz7XAHVDd
	 baz5WdlMTx1jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4471380AA5E;
	Sat, 21 Nov 2026 01:20:11 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/2] tcp: do not accept ACK of our ISS on active
 opens
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522401027.873873.9137118400296045450.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 01:20:10 +0000
References: <20261118172654.1267071-1-edumazet@kernel.org>
In-Reply-To: <20261118172654.1267071-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 ncardwell@google.com, kuniyu@google.com, horms@kernel.org,
 flavius.mazilu@stud.acs.upb.ro, tuexen@fh-muenster.de, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 18:26:52 +0100 you wrote:
> Michael Tuexen asked on the tcpm list whether, after a completed
> handshake, a segment with SEG.ACK == ISS is a duplicate ACK or a ghost
> ACK [1]. Flavius-Romeo Mazilu noted that Linux gives a different answer
> on each side of the connection [2]: passive opens send a challenge ACK,
> active opens silently accept the segment.
> 
> The first patch makes active opens (including Fast Open and
> simultaneous opens) behave like passive ones, without changing
> the value of tcpi_bytes_acked seen by user space and BPF.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] tcp: do not accept ACK of our ISS on active opens
    https://git.kernel.org/netdev/net-next/c/a25df726c715
  - [net-next,2/2] selftests/net: packetdrill: add tests for ACK of ISS
    https://git.kernel.org/netdev/net-next/c/5fa71aea9d59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


