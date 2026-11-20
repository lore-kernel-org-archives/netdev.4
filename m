Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156909;
	b=Pjwcfxbpdh0Lmy/bYELG8h1FdX9Zn8ApzLAbWAGHJPEUqG4B5sdQFwsPRT71PTWvHDPI
	 I0E+qJD4iz6ls8p3pQ9Y4aZvR2xevjpBCdexiQvP4y3dir4vzY3h5jmDM9O989SfbU7Ty
	 HWrvyij6P33IK82jQmiOlIu0AoVLDVS3myCoXv4q46TfCDo9Zus5yDPxapE1I/o3/96qb
	 kMoqB4WnVh0Wn/tIrVJzN/7dXRzd94yCAyrX13AmwwKvcDPnaYG76ypfM+PUmbLX8hi9w
	 55ykwIhs/9I+1fKuSbPz4zXz4fdhxl/CzcuWvgrMiooH+CWt1vd+NksbYVOtASI/GeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156909;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hel37/Epjlq7DaohvvHasctAg1zGKRp6Mh3HCFijiFE=;
	b=nF0kEQGRLOd7VRob0PXx0XRs+hXUudw2M/3UGYq4bcbDSd7glT7j4iE1p+GCaDi1sVsh
	 j7VhgMqeXflY4ERWGWGLwdDuwAE3JHWoppnPr0y5C7QMpxqt+SJMeJwGmMxg/P538eB29
	 OG4Qz+MQu9R9uDdq3X8mGeOHZWsaR/ujX6g7RD3YzEZ/IZ2jFNiL/z876OgYCbIkFgl9j
	 L/fOTEjOgUzYSC3gPy65hv001RyVtDkFneRlndO8S7vP6TONKsli/LqjqJyUIJd/E/vZq
	 1f+UH9cWxxZMthyACv0afJIYqsJ0ONhlT+HibjvCiK+LVvkezu78UO624Q9G3/9eTOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoJnvdxp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A49606A320;
	Fri, 20 Nov 2026 06:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoJnvdxp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71291F000C4;
	Fri, 20 Nov 2026 06:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156908;
	bh=hel37/Epjlq7DaohvvHasctAg1zGKRp6Mh3HCFijiFE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MoJnvdxp7n9nMHpCSkBftVygNiGA/hQQIu+Xzg0NI353YyJGHQTbekN/UQPO5u6h1
	 B4h3rVYp+Z4jJI5NDAFCEv24R6NPT2aK7fp5ilwvj2m4BC6tX13tDGAxdIkIfeDAd6
	 GhPKaaqSvlFruVGcrQBPhn4te0bAePF7I/VuxG/F9KqOe5wSv64dl9sV4mrUvrwC4u
	 Smwy6m/8xtiLpjXjI8M33VzV7/FsdGiPU5z71l+I2c1LYAvS+cXYhITWuwEsPy4Yz3
	 ZAKMPPyCduxqSOzDa68cLqPitsZBAwWoZXWL3GFvp6Trj83e51DRr+cu/BhUW7T6nL
	 8XgOwWtUD90Yg==
Subject:
 Re: [PATCH net v5 04/14] net: pse-pd: do not keep a failed IRQ in pcdev->irq
From: netdev-bot+sashiko@kernel.org
To: github@szelinsky.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 maxime.chevallier@bootlin.com, kyle.swenson@est.tech, ross@r-sc.ca,
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 06:41:47 +0000
Message-ID: <179515690732.3136.5656168477825917127@kernel.org>
In-Reply-To: <20261118183957.2031311-5-github@szelinsky.de>
References: <20261118183957.2031311-5-github@szelinsky.de>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch keeps pcdev->irq accurate only when the IRQ request
  fails.

--

net: pse-pd: do not keep a failed IRQ in pcdev->irq

This patch clears pcdev->irq in devm_pse_irq_helper() when
devm_request_threaded_irq() fails. Without that, the failed probe's
pse_controller_unregister() calls disable_irq() on a line the controller
does not own. pcdev->irq is now set before the request because pse_isr()
can read it as soon as the IRQ is enabled.

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index 0cce17670d0b9..0894613515e0d 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
> @@ -1341,14 +1341,20 @@ int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
>  	if (!h->notifs_mask)
>  		return -ENOMEM;
>  
> +	/* pse_isr() can run as soon as the IRQ is enabled, and
> +	 * pse_pw_d_is_sw_pw_control() reads pcdev->irq.
> +	 */
> +	pcdev->irq = irq;
>  	ret = devm_request_threaded_irq(dev, irq, NULL, pse_isr,
>  					IRQF_ONESHOT | irq_flags,
>  					irq_name, h);
> -	if (ret)
> +	if (ret) {
> +		pcdev->irq = 0;
>  		dev_err(pcdev->dev, "Failed to request IRQ %d\n", irq);
> +		return ret;
> +	}

[Severity: Medium]
This covers the failed request. Can pcdev->irq still go stale on a normal
unbind?

The only caller of devm_pse_irq_helper() is tps23881. It registers the
controller devres first and requests the IRQ after that:

drivers/net/pse-pd/tps23881.c:tps23881_i2c_probe() {
    ...
	ret = devm_pse_controller_register(dev, &priv->pcdev);
    ...
	return tps23881_setup_irq(priv, client->irq);
}

tps23881_setup_irq() then calls devm_pse_irq_helper(). Devres releases in
LIFO order, so on unbind or rmmod the teardown runs:

devres_release_all()
  devm_irq_release()
    free_irq()
  devm_pse_controller_release()
    pse_controller_unregister()

By that point pse_controller_unregister() no longer owns the line, but it
still does:

	if (pcdev->irq)
		disable_irq(pcdev->irq);

This is the same problem the commit message describes, except that the
stale pcdev->irq comes from devres teardown and not from a failed request.

Suppose another device requests the same line between free_irq() and
disable_irq(). __setup_irq() resets the depth to 0, and this disable_irq()
then leaves the line masked for that device, with no matching
enable_irq().

A future caller passing IRQF_SHARED through the exported irq_flags
argument would hit this on every unbind, because the other sharers stay on
the line after free_irq().

Could pcdev->irq also be cleared when the devm IRQ is released? One option
is a devm action registered before devm_request_threaded_irq() that resets
pcdev->irq. Then pse_controller_unregister() would skip disable_irq() on
this path too.

>  
> -	pcdev->irq = irq;
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(devm_pse_irq_helper);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118183957.2031311-1-github%40szelinsky.de
