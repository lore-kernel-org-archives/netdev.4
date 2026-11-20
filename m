Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151238;
	b=IxbVwi4RTO5uXs08ZAAt05Wcl6Y0iDTbJJQi3gd1P8KmBi4ecDcDKaQpNeSTMR25ZCG3
	 kUIoDbrN00I1FUhlMPCpgsCT69uFphQcwcc8HWlbKWqsthnDvfqLemyL24o255/+szIHh
	 qoAXXgyavGhtoVxWk5hCbI96dv4QfgDO1wBDAFCA+8p5k6a9GKVClyihIcjmH+SYBbWAP
	 t97nEwCLJZWZJE2CUCYWdgrRYfHF4ZpV+RlFZyTGZL02ds4IlX1IIYgNP077Ps+JOZxsz
	 oRjmUr55MXzV9QaJuF8c1FhJGQuD3+j6N7pFJFiSWDdxiMCPk3N1T8AL42CQvnrvQQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151238;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=r7ro0o9mchZpsV5Fg9CWlcyIAXb1X25O0eU4eBlOp58=;
	b=eKWNLWHNUHS2iHMrKvWPqSqC8Djhqt+IHDtc/RywEN0lyjWLTOV+Dw1Z/7vdrcHWvRSO
	 HZyBSvbjt/9veKELXMgM/246DL7Lzc03jb8vcRSBWuqLJm361sDs+lJ3bWym1OJrkowN6
	 qOaC2aIMUt7nOXwaHfZwN0AtKumTEc/Vzidm0TQY8wamtgH310H/fQf7rwC74gntPDw7K
	 ziB3NIFiMARglFVcdAMVOBzel/3BdJnLm3LDK6j46bhjw2yndKoKhtRWvJZNvZDXqKu+P
	 udcpIDkhBl5AGTr2cab0ff7LtBbAkiq92bXBSQm4DHTX/fyKagcgNg4S2RYiyLqeH/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz3ufiub;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54A5606A320;
	Fri, 20 Nov 2026 05:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz3ufiub
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F941F000C6;
	Fri, 20 Nov 2026 05:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795151238;
	bh=r7ro0o9mchZpsV5Fg9CWlcyIAXb1X25O0eU4eBlOp58=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hz3ufiubOrS1q/kA51l0Rl9gPb0zk2h5llOQKiAfAWQtAZHFy3dVtiydjEa2BtJU8
	 +j3WzyfXryfvdmq3pGpZaImD9KPw1K/RbVp7KoWgGuZ3boBd09Zerqm5zumOkK/w5w
	 H2DIMSOfZKfITJXNVEJf5pWy1YVIjwGJWd1RcQgzZ9Qsqbmr/xzywhy0LO1ZybcIsc
	 CtES14qCSHSSbhZDUTUaP/NMRcArFyRzJ80DUPQGEwwZLV+vNrV9GrJsj9GT4/e11R
	 0T0OUeahnqPoz0r6Qa8GwVp9uW6numOljQ1G0nYC0WE0TnBY5a8yABU7UilVXv20fN
	 Wcn/W5gxcdKeA==
Subject:
 Re: [PATCH net] bnxt_en: Fix auxiliary device leak on early probe failures
From: netdev-bot+sashiko@kernel.org
To: lcy8047@gmail.com
Cc: michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vikas.gupta@broadcom.com,
 andrew.gospodarek@broadcom.com, jacob.e.keller@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 05:07:17 +0000
Message-ID: <179515123717.3136.1891710789877841672@kernel.org>
In-Reply-To: <20261118050716.3873167-1-lcy8047@gmail.com>
References: <20261118050716.3873167-1-lcy8047@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In bnxt_init_one()
  (drivers/net/ethernet/broadcom/bnxt/bnxt.c), a bnxt_pf_wq allocation…
- [Medium] bnxt_en: skipped bnxt_clear_int_mode() on bnxt_pf_wq error in
  bnxt_init_one()
- [Low] The commit message lists the leaking failure points as
  bnxt_set_dflt_rings(), bnxt_init_int_mode() and the bnxt_pf_wq…

--

bnxt_en: Fix auxiliary device leak on early probe failures

This patch adds an init_err_auxdev label to bnxt_init_one(). Failures
after bnxt_aux_devices_init() now uninitialize the auxiliary devices and
free the auxdev ID. The bnxt_set_dflt_rings(), bnxt_init_int_mode() and
bnxt_pf_wq failure paths jump to the new label. On the register_netdev()
failure path, the aux cleanup now runs after bnxt_clear_int_mode().

> bnxt_init_one() allocates the auxiliary device ID and initializes the
> auxiliary devices before bnxt_set_dflt_rings(). If that call,
> bnxt_init_int_mode() or the bnxt_pf_wq allocation fails, probe jumps to
> init_err_pci_clean, which does not uninitialize the devices or free the
> ID. Only init_err_cleanup does.

[Severity: Low]

This list leaves out one path whose behaviour the patch also changes:
the bnxt_dl_register() failure that jumps to init_err_dl.

Before the patch, init_err_dl ran bnxt_shutdown_tc() and
bnxt_clear_int_mode() and then fell straight into init_err_pci_clean.
That skipped bnxt_aux_devices_uninit() and bnxt_auxdev_id_free(), so
aux_priv, edev, ulp_tbl and the bnxt_aux_dev_ids entry leaked on that
path too.

Now init_err_dl falls through into init_err_auxdev, so that path gets the
aux cleanup. The code change is fine. Could the commit message name this
path as well, so the scope is clear to backporters?

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index e78cf7ad3cbc8..ba0e458a467f5 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c

[ ... ]

> @@ -17449,7 +17449,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>  			if (!bnxt_pf_wq) {
>  				dev_err(&pdev->dev, "Unable to create workqueue.\n");
>  				rc = -ENOMEM;
> -				goto init_err_pci_clean;
> +				goto init_err_auxdev;

[Severity: Medium]
Does this path still leak the MSI-X vectors and bp->irq_tbl?

By the time create_singlethread_workqueue() runs, bnxt_init_int_mode()
has already succeeded. It has allocated the MSI-X vectors with
pci_alloc_irq_vectors() and allocated bp->irq_tbl. The new
init_err_auxdev label sits below bnxt_clear_int_mode() under
init_err_dl, so jumping to it skips the only call that releases them.
Nothing under init_err_pci_clean or init_err_free calls
pci_free_irq_vectors() or frees the table either. bnxt_cleanup_pci()
only unmaps the BARs, releases the regions and disables the device.

This can happen on the first PF probe, while bnxt_pf_wq is still NULL,
if the workqueue allocation fails. Once free_netdev() frees bp, the
irq_tbl pointer is lost. The vectors also stay allocated on bp->pdev
with msix_enabled still set. A later probe of the same function would
then trip the msix_enabled WARN_ON_ONCE() in __pci_enable_msix_range()
and fail to set up interrupts.

The old init_err_pci_clean target had the same gap. The commit message
says the unwind now follows the reverse order of setup, so should this
goto jump to init_err_dl instead?

At that point bp->tc_info is still NULL, so bnxt_shutdown_tc() returns
early. bnxt_clear_int_mode() then frees the vectors and irq_tbl, and
execution falls through into the new aux cleanup.

[Severity: Medium]

Does this path still leak the MSI-X vectors and bp->irq_tbl?

By this point bnxt_init_int_mode() has already succeeded. It has called
pci_alloc_irq_vectors() and allocated bp->irq_tbl. The new label sits
below bnxt_clear_int_mode():

init_err_dl:
	bnxt_shutdown_tc(bp);
	bnxt_clear_int_mode(bp);
init_err_auxdev:
	bnxt_aux_devices_uninit(bp);
	bnxt_auxdev_id_free(bp, bp->auxdev_id);

Nothing under init_err_pci_clean frees the vectors or the table either.
bnxt_cleanup_pci() only disables PTM, unmaps the BARs, releases the
regions and disables the device.

This can happen on the first PF probe, while bnxt_pf_wq is still NULL, if
create_singlethread_workqueue() fails. After free_netdev() the irq_tbl
pointer is lost and pdev->msix_enabled stays set.
msi_device_data_release() would then hit its WARN_ON_ONCE(!xa_empty(...))
on devres release. A later probe of the same function would also fail in
__pci_enable_msix_range():

	if (WARN_ON_ONCE(dev->msix_enabled))
		return -EINVAL;

The old init_err_pci_clean target had the same gap. Since this goto is
being rewritten to unwind in reverse order of setup, should it jump to
init_err_dl instead?

At that point bnxt_shutdown_tc() is a no-op because bp->tc_info is still
NULL. bnxt_clear_int_mode() would release the vectors and irq_tbl, and
execution would then fall through into the new aux cleanup.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118050716.3873167-1-lcy8047%40gmail.com
