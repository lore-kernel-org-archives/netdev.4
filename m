Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487383;
	b=ORqc9uOagvNDlxqAJwzZ1jDKXOC5YVUGAIBLTYLU81OKpj6xgHmtzCWVww43JwYCppAi
	 J2HGTiGuuYKtWeWhinwd26k1DZQWQchUC07aOzB9E0QEXPZVoOlzXY1s+BGLsI/eHkik9
	 Rz+k4A6wpyD7XNv8yqCGRW6Mnf2jwjd3l6oDwAXdE0zIBfH02MqNW905C7Tuy8dsV/3ye
	 PuFXeGlZfsTeitZsAgQ7Iq25rF0dcUUloiODb/tYWSbxYoePIQzgH46Cza9aIY0PEKUx8
	 E7gg67wzyB2IPxcuMst4z8K0IRd5yrv1aKtn84kvGMHlmK1Ha6zZLTV5hL2Kl7vLung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487383;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TS/eTkS+HHxORAn1RQh4jjy30JBgtF0noHxXbDta8Ks=;
	b=apmvG/yFETKUah0stHnRpf5lHiYcji65XFmoQD7bI5pHWKb53z9DMRWfuFdfJ/5BAyPf
	 Wxq77WNP3dna8Bo6Yp0U4MwOIBU84WviHrrdNERcU/B3o6whGo+przWgivER/z8UKpJRV
	 6ibdfoMxO/OzBOOp9/aWQkA37xcg/PEVd1/lf49d2PlByHESuVeDe/AEg5FKbY31RV3As
	 Gr1/TpSnqD4VMRH8s4WCOeFmn0b50HpTRw4zWdaiI1Ite8joRtWgIeXL50tI97U8wJV2s
	 6WPxNdwNPSST5zkWv/1zau8BNkZB2co8W1grP+TqHLV26oeGuZQfpgo8VkxDfpeW4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJvvcG5M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119E606A327;
	Tue, 24 Nov 2026 02:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJvvcG5M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC1E1F000C0;
	Tue, 24 Nov 2026 02:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487383;
	bh=TS/eTkS+HHxORAn1RQh4jjy30JBgtF0noHxXbDta8Ks=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JJvvcG5MALJ7lSa1MnTsXQXda22NfoyiFmmwbCjPKGty9Y9ouNKa2vNsmdkC0u3XH
	 Q9LdUAaLLkFXEvbuooKR0Q/0kbExjDprjcoYGxz5/c2nDEr632l1KiU0GTMui+n5Ls
	 vXIcZpTVa2YfYDvsaEWOhiYgujznhAdbyXf5qXVU6k+b4sBG6TvpdM9aKdloXxx86q
	 ErnDkn6mIyUnqYvj3S9HwL+1sO9lhZDoP8SbRUDsnsM4/NGvNeayd+yMAtFR1WJw3+
	 Odb4BJIUWiSCcvxoGhCTx/3NexsQISiXU7RxffpKiEYXyP1SpuKKvZvNZaws8rYvUc
	 E3WObRIJN6aDw==
Subject: Re: [PATCH net v7 4/6] net: wwan: t7xx: do not exit the TX push
 kthread on resume failure
From: netdev-bot+sashiko@kernel.org
To: tim770802@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 haijun.liu@mediatek.com, ricardo.martinez@linux.intel.com,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 ilpo.jarvinen@linux.intel.com, sreehari.kancharla@linux.intel.com,
 m.chetan.kumar@linux.intel.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, tim.jh.chen@wnc.com.tw,
 Chih.Hung.Huang@wnc.com.tw
Date: Tue, 24 Nov 2026 02:29:41 +0000
Message-ID: <179548738191.3135.16797574721036065540@kernel.org>
In-Reply-To: <20261120015556.131547-5-tim770802@gmail.com>
References: <20261120015556.131547-5-tim770802@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] net: wwan: t7xx: wrong Fixes tag for
  t7xx_dpmaif_tx_hw_push_thread() exit

--

> diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
> --- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
> +++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
> @@ -468,8 +469,19 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
>  		ret = pm_runtime_resume(dpmaif_ctrl->dev);
>  		if (ret < 0 && ret != -EACCES) {
>  			pm_runtime_put_noidle(dpmaif_ctrl->dev);
> -			return ret;
> +			/* Do not exit: t7xx_dpmaif_tx_thread_rel() kthread_stop()s
> +			 * this task. Retry until the resume works or we are stopped.
> +			 */
> +			if (!resume_failed)
> +				dev_err(dpmaif_ctrl->dev,
> +					"Failed to resume for TX push: %d\n", ret);
> +			resume_failed = true;
> +			wait_event_interruptible_timeout(dpmaif_ctrl->tx_wq,
> +							 kthread_should_stop(),
> +							 HZ);
> +			continue;
>  		}
> +		resume_failed = false;
>  
>  		/* A runtime suspended device was resumed above and had its queues
>  		 * restarted, so a stopped queue here belongs to a system suspend

[Severity: Low]
The Fixes tag seems to point at the wrong commit. As far as I can
tell, 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
only added the system suspend/resume PM entity callbacks. It did not
touch t7xx_hif_dpmaif_tx.c at all.

The pm_runtime_resume() call in t7xx_dpmaif_tx_hw_push_thread() came
in with d10b3a695ba0 ("net: wwan: t7xx: Runtime PM"). So did the early
return when ret < 0 && ret != -EACCES. That return is what lets the
kthread exit and leaves dpmaif_ctrl->tx_thread pointing at a dead
task.

The tag drives stable backport selection, so it matters which trees
this lands in. Could you confirm with git blame and, if you agree,
change it to:

Fixes: d10b3a695ba0 ("net: wwan: t7xx: Runtime PM")

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120015556.131547-1-tim770802%40gmail.com
