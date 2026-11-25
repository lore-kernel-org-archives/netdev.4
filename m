Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603154;
	b=X/AMEHcxW5e1CHKL6540DPLfSHhGBxs1Q1uOF9qu5wliIeoFsPx1X7FmJcSywiuLJ8zZ
	 md0jJH3JMNfOwolaAJsJxwSZ8+rHCj1GxD0WPrUAxcvwrtKYajKvCXcT5zrLt1tnx6ErV
	 apyqZy4z1bJxEjB1T8xijtvAZekk5HaqMWbwrG256f8tEuuHuIUQl72KDWETlp4Grk37N
	 1ExKX+I08quh55XvS7L5fWacjnFRFd93OVbt7ZkRlf/iMrBbJcaN2oICUUJtE+LtOwNob
	 dDs4UO8AV7j0qkUvsWT9clorMsIoEvw/FwTEUQjVvj9bwa6zlIYuhnS2QqIIYmPJQFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603154;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=99+nx5kiE5SfUzLb8n+CdHLxKeAXEkt8ftQI5zT19Zw=;
	b=opdO4U/F5sWAZe9LkaW2br/wrSg8+avv2o6CaY5cfAWTMpHUBlVikBCSH5BY5nTNV5T9
	 1FCobUiviMogInlYmWpJNtYIbtc5wPI4+2QMN3+VgX92UCiiXlYeXgp1c+eAMYBdupt+v
	 OfsDPxxGkGdCdtbE2VK6u9uBmKAwzuDrCUNGNva1NK/pO9qt/59kBIFv8sQAB3XiUbDPF
	 Dx2FuftjPlvQSv9fzFQkYvEGWYj6BY3+XCA+JzFhsgBv8beZoGnRId4bh+DZZQECeNopt
	 IFw2E2JjW6cYbLdMpyK1Jf162yofVmENqSqDiY3y+tystp+I6G7yUsl8tKXmns3CPkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQGC8C0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BE7606A31E;
	Wed, 25 Nov 2026 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQGC8C0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AE71F000CA;
	Wed, 25 Nov 2026 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795603154;
	bh=99+nx5kiE5SfUzLb8n+CdHLxKeAXEkt8ftQI5zT19Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TQGC8C0e1Ga8ccjLSzibaFfQj3GiF6rJbsRzuQr2T59I6btPjsEQVOshe/GGh5AYM
	 Y6wUSmCY9hZ1lBAIas6UNT8Be96ljiNi0akdC4MgktXljS0JXM0ZskC0MsKFw/q60J
	 VWfqeGkI0ZUgNZbuRLlUSv5b52DIsxyNXnI6sm1rLix6zdaPTAKTlY3j7zlP794nL3
	 tyDB94SJvEJj0+Z6qEnZ0Kaye/0U3F8RDknMnlcNE4amyLewXI9/X49RYDlTBpfR+Z
	 SIAB/F6wx+dqyITCaTvJRM8/VVpcugQonO0BMeXwtVKiAszuy60YUWfN9d68F13Gkx
	 di881NMx08FkA==
Date: Wed, 25 Nov 2026 10:39:09 +0000
From: Simon Horman <horms@kernel.org>
To: Jijie Shao <shaojijie@huawei.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
	liuyonglong@huawei.com, chenhao418@huawei.com,
	yangshuaisong@h-partners.com, ningwei15@huawei.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 net 4/4] net: hns3: fix use-after-free in debugfs read
 during reset/unload
Message-ID: <20261125103909.GR31322@horms.kernel.org>
References: <20261118130330.3026625-1-shaojijie@huawei.com>
 <20261118130330.3026625-5-shaojijie@huawei.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118130330.3026625-5-shaojijie@huawei.com>

On Wed, Nov 18, 2026 at 09:03:30PM +0800, Jijie Shao wrote:
> The seq_file refactoring of hns3 debugfs removed the per-file entry
> state checks. Without them, debugfs show callbacks can access
> priv->ring, priv->tqp_vector, and ring->desc while these resources
> are being freed by reset, driver unload, or ethtool ring resize.
> 
> Plain state-bit checks leave a TOCTOU window between check and use.
> 
> Fix by adding a mutex (dbg_mutex) to struct hnae3_handle, used by
> enet-layer debugfs callbacks. Readers acquire the mutex, then check
> device state per iteration -- this lets an in-flight reader exit
> promptly when reset begins mid-dump, keeping reset latency bounded
> by one iteration, and also rejects a reader that arrives after the
> writer has finished tearing down resources (priv->ring is NULL by
> then). The dbg_uninit() call stays outside the mutex to avoid
> deadlock with debugfs_remove_recursive().
> 
> Two kinds of writer paths are protected:
> 
>   * hns3_client_uninit() and hns3_reset_notify_uninit_enet() clear
>     HNS3_NIC_STATE_INITED first so that readers running outside the
>     mutex see the device as busy and return -EBUSY early, then take
>     dbg_mutex before freeing resources.
> 
>   * hns3_set_ringparam() calls ndo_stop() first (which sets
>     HNS3_NIC_STATE_DOWN) and then takes dbg_mutex around the ring
>     re-allocation. The busy check does not test the DOWN bit, so
>     readers that arrive here are blocked by the mutex itself rather
>     than by the INITED signal.
> 
> Userspace-visible changes: debugfs reads under
> /sys/kernel/debug/hns3/*/ that race with reset, driver unload, or
> ethtool ring resize now return -EBUSY instead of potentially reading
> freed or zero-filled memory. The per-iteration busy error is -EBUSY
> instead of -EPERM, and a NULL priv->ring now returns -EBUSY instead
> of -EFAULT. Reading page_pool_info when page pools are not
> initialized now succeeds and prints "page pool not initialized" per
> queue instead of failing with -EFAULT.
> 
> Fixes: a723fb8efe29d3 ("net: hns3: refine for set ring parameters")
> Fixes: eced3d1c41db ("net: hns3: use seq_file for files in queue/ in debugfs")
> Closes: https://lore.kernel.org/all/a0853cd9-cab5-441d-b181-8ba97f2f58b0@huawei.com/
> Signed-off-by: Jijie Shao <shaojijie@huawei.com>

Reviewed-by: Simon Horman <horms@kernel.org>

