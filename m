Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570805;
	b=Y/pvGX5uiKUbO1OeB8o8bxKXMaVFCMB6FXU5oCeFUaDyo11l5dvifidhqP+SBZmU7ypn
	 Tj44iry67qxlUYWM+c6fl4nPJypRE1YkwYfF1qUWKVvgsp2xT4n07xuJ27Hmf5aWb09Gk
	 jHbYkoBds0eP/PSyPOqo2PlEUG9/b3gTfioJYgZU+Nrh5T6wDU2/FArRxSxQZZxiqPG4e
	 o/1I2jTSDNS11nHrurHeyQKg8Gyp+q3U28Jd20ghPMZsErABAHa0vf94xiXGHHdcgotqK
	 LX5kwq4qRCyTYSmiEG4uXGSEwEzzfZPEVfhVw/eOyONfPrnZSfJJcJ4TpRoxEbeVk3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570805;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=N1054bmPlXYgbxbb4Yzcf7GzEuGZMyWrUBjTbwWOVqE=;
	b=VKgRPZZlCxhOOuWwgH/7ndskouNfgObL+Iu4Vzc7xnAZLAJcXSCh9kfOPkOOCVTcG95u
	 XehLWvFZPQnvpNWfnVVwxp0hqMA9/RGmgJ/JLnGRIc/Sfo7cqirkQ+ci1LgkgNt+UtKEO
	 3GHLcIrw1ZGdK9JE7+QeObzeHd3dQliJh/LZx3R+/VmRUxtH0wn62mPxZyk4UKTuTSa/Q
	 RMaG4PzW+IqK5myyMj843+rOwMZXbcZhTrjn07LqaHGXnCdkoMjfLXIBflDdwqXELkFj+
	 HWb05YFp4Y0zFbTBAwx/fDz9P1ioC4+kp1n5ZdDhIDa3OgTcJaVofhlpZcRh3zXW/mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifOQru2T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA2606A31E;
	Wed, 25 Nov 2026 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifOQru2T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD61C1F000C6;
	Wed, 25 Nov 2026 01:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570804;
	bh=N1054bmPlXYgbxbb4Yzcf7GzEuGZMyWrUBjTbwWOVqE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ifOQru2Tc1x/SGYx9EZlhQcDkgzU+ts7uOW27xUUCy07s56EttYwZiie0ACsyDkI0
	 bOTAZCxQHYiYhBdyUiLMzZT2AtVsnbiZeZxl9GfCulPE79RK9Mu1SBXIZ07MxKp5cR
	 jfUDkHc8UErIYpzk9/uuE7JKZ6AzR+/0H7yIvKta3ILnf4QHtWdQMCCatcakCAgoVe
	 8s33BPmJu6SqsFI6kALdF+a++suUefW83tD7dyK93BdBVGoxAYWV/jCX0p4+UfBPAg
	 Uf4O1FRPPqbMonUh/eDwSI1PuVSr6ISX0b/xF6Zkn57FjniTDPU/g1yv1eKIO6wRq2
	 zUWEXnIHbmLLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45063808209;
	Wed, 25 Nov 2026 01:40:04 +0000 (UTC)
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
Subject: Re: [PATCH] net: bcmasp: avoid refcount drain on probe
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179557080364.155974.7410172128564360840.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 01:40:03 +0000
References: <1795076102979-9-385853cc@mail.zgclab.edu.cn>
In-Reply-To: <1795076102979-9-385853cc@mail.zgclab.edu.cn>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Thu, 19 Nov 2026 16:15:02 +0800 you wrote:
> bcmasp_probe() calls of_find_node_by_name(dev->of_node, "ethernet-ports"),
> which unconditionally drops the from-node reference the caller never held.
> Every probe or bind cycle that reaches the port scan, including ones that
> later fail with "No ports found", drains the asp node refcount by one. Once
> it hits zero, of_node_release() deadlocks in its error printk (%pOF on the
> parent while holding devtree_lock with IRQs off), so the machine freezes
> silently with nothing on the console.
> 
> [...]

Here is the summary with links:
  - net: bcmasp: avoid refcount drain on probe
    https://git.kernel.org/netdev/net/c/846a6d0982be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


