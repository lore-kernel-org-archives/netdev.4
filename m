Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089972;
	b=3QJ3ySlrp1Jga2F9wLq7UhyXMbBZ+GxMO62iBZcko0Df2gsrRPHUz3bhVw6H6XSaifEw
	 VkUoe9KGRlxcyXP8uLxE926Y0QKbDdCsemUZH1RWce6YrauJkurYSmYg+m6V6ofCeVR2a
	 Tut3GKZxl2DusnN++j+5sV8wp+NMzXJqfQAPihkDTjmVaECiU+X0jtyH4jfdcZ95jGIEU
	 TENq6PnzE11z5MJKT7ep/0XkW3eWNUnQUQ+5/f1akwv007aFSS4k9vrfg0+YHTT4wIoxQ
	 A4gijBSnmaqM4YYvO3bwdQ+0XHTRnX6gpdr7Fu9FICSo0hKX/m1XNeVrEM0mIqJGALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089972;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QlG1PSucPRqwLJfn+zLLZEOkrK7C+VjUVk19t5QANi8=;
	b=jU/bZoxRy+dVMDP+MUGYgyi9S45KE2RUrRJHM0JLMzZVgucb3V6qitb9kkDdPIHgTbBQ
	 p9kB2HWZ8GFhCy+9Ifs1rzjRKl/TH6GWaiugSpw3Vu9CDXSE4rRIDAn4IGCPD2Ua/ESMn
	 mvgkobbm4qFVM6BR4INygfEngnNSr9RJRPviX9bH2r5Azid2ZJmacjdS+fTYlt5xOTaOH
	 0UmqBfpoo0vjOOypPrWzC6RVKnpSfcnGOuIJ8JKf3dhi94zzxM2tdOmUxXYWAnZv4H8Of
	 bdF3ukIcANvtCoyr0zLSt++CrfQyfy/qKRhdkg1Q/dnnw2tkpKtZPyaGdSxy+6Owvsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frPlM8fG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FAA606A320;
	Thu, 19 Nov 2026 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frPlM8fG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444251F000C5;
	Thu, 19 Nov 2026 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089972;
	bh=QlG1PSucPRqwLJfn+zLLZEOkrK7C+VjUVk19t5QANi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=frPlM8fGEq4/5cb0ws4Z779uGOza+6UbF+K8K34wXvpHYQ2YkVKLFHVi5KQIB10FR
	 z8oTUh/lUqn8APM7VKvskQBKMYSTZD99U8oFqt0ohkBtucsEhochLQoee3x3MzZj2Q
	 b2hrVbLkxsBtax7rjU0szdKStu8xmvSqpSdxy2HreEPFbiWbD9Cn8yM0zEQCLTCXAV
	 ONolJMRrEtKi25EFW4Scww1edPuWpKxYtgAC6IdB5AD2Ho0oOxMboNWFI89XwVcUKA
	 0nzRCzx67DcMqACqdrY1Rr6ThGIgpvV+V3VWd1QO5DpPJxF2LuvblN5tkWiKJtQz80
	 j8HZK5DCKQHng==
From: Simon Horman <horms@kernel.org>
To: han.junyang@zte.com.cn
Cc: Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	ran.ming@zte.com.cn,
	han.chengfei@zte.com.cn,
	zhang.yanze@zte.com.cn
Subject: Re: [PATCH net-next v6 1/3] dinghai: add firmware version check and RISC-V readiness polling
Date: Thu, 19 Nov 2026 12:05:37 +0000
Message-ID: <20261119120536.1041197-2-horms@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113135038394NowoSxTdiA32KKAPcTmCa@zte.com.cn>
References: <20261113135038394NowoSxTdiA32KKAPcTmCa@zte.com.cn>
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20261113135038394NowoSxTdiA32KKAPcTmCa@zte.com.cn?part=1
---
dinghai: add firmware version check and RISC-V readiness polling

This commit polls the BAR 0 firmware compatibility block to verify the
driver/firmware version contract during PF probe and waits for the RISC-V
management core power-on flag when supported.

> diff --git a/drivers/net/ethernet/zte/dinghai/en_pf.c b/drivers/net/ethernet/zte/dinghai/en_pf.c
> index 86d4374088203..ddff9b0438fb3 100644
> --- a/drivers/net/ethernet/zte/dinghai/en_pf.c
> +++ b/drivers/net/ethernet/zte/dinghai/en_pf.c

[ ... ]

> @@ -369,6 +371,120 @@ int zxdh_pf_modern_cfg_init(struct zxdh_core_dev *zxdh_dev)
>  	return ret;
>  }
>  
> +/* The firmware fills the compatibility block field by field, so it is
> + * only ready to be read once every field we consume has lost its
> + * erased value.
> + */
> +static bool zxdh_pf_fw_compat_ready(struct zxdh_fw_compat __iomem *compat)
> +{
> +	return ioread8(&compat->module_id) != 0xffU &&
> +	       ioread8(&compat->major) != 0xffU &&
> +	       ioread8(&compat->fw_minor) != 0xffU &&
> +	       ioread8(&compat->drv_minor) != 0xffU &&
> +	       ioread16(&compat->patch) != 0xffffU;
> +}
> +
> +/* Read the firmware version block and verify the driver/firmware
> + * version contract.
> + */
> +static int zxdh_pf_fw_compat_check(struct zxdh_core_dev *zxdh_dev)
> +{
> +	struct zxdh_pf_dev *pf_dev = zxdh_dev->priv;
> +	struct zxdh_fw_compat __iomem *compat;
> +	struct zxdh_fw_compat *fw_compat;
> +	bool ready;
> +	int err;
> +
> +	fw_compat = &pf_dev->fw_compat;
> +	compat = pf_dev->pci_ioremap_addr[0] + ZXDH_FW_COMPAT_OFFSET;
> +
> +	/* The firmware publishes the block within 10 s of boot; wait twice
> +	 * that to leave margin.
> +	 */
> +	err = readx_poll_timeout(zxdh_pf_fw_compat_ready, compat, ready,
> +				 ready, USEC_PER_SEC,
> +				 ZXDH_FW_COMPAT_TIMEOUT_SEC * USEC_PER_SEC);
> +	if (err)
> +		dev_info(zxdh_dev->device,
> +			 "compat region not populated, assuming legacy firmware\n");
> +
> +	/* Firmware predating the compatibility region keeps the erased
> +	 * pattern, which fails the module id check below and defers the
> +	 * decision to the readiness wait.
> +	 */
> +	fw_compat->module_id = ioread8(&compat->module_id);
> +	fw_compat->major = ioread8(&compat->major);
> +	fw_compat->fw_minor = ioread8(&compat->fw_minor);
> +	fw_compat->drv_minor = ioread8(&compat->drv_minor);
> +	fw_compat->patch = ioread16(&compat->patch);

[Severity: Medium]
Does falling through on timeout here read and validate a partially populated
compatibility block?

Since the firmware populates compat field by field, readx_poll_timeout() can
time out after module_id is set to ZXDH_MODULE_ID while later fields still
hold 0xff or 0xffff.  In that case the module_id check does not bail out, and
zxdh_pf_fw_compat_check() either fails probe with -EINVAL (if major or
drv_minor is still 0xff) or records fw_compat->patch as 0xffff, causing
zxdh_pf_wait_riscv_ready() to wait 40 seconds for riscv_power_on.  Should the
if (err) branch set fw_compat->patch = 0 and return 0 directly?
