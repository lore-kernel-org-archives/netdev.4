Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772699;
	b=0IkvjckOnOs64wjg1Qo0YQSHA621NyaBECwZn63eRHFkUiPQU4ZOFdwY+IxPGFYYsWAk
	 +LsWj6d29iE6phdnsQIBUC2ixjTf3YIvUiU3tWGOpvLYGjNpX9cTsOtxYycCJpTpAl3AJ
	 YTMxVR6iBuDdabNXMs64aBn7TE/9ussqVRy0Fy7WZ9SLyUQmzO1ZZ+lrCR4Stj4pWy5Sp
	 eux45lMtxVUEdBnnUtO+Xmac7qMl1uZqtVVcRfMo8ecKTpX0UwIQjnPWBmpMkkbG3tc8F
	 wrsAoTi2A9hduhFU7v7xbb4t5R8p0JEVh5UoKTBwmGgGLbGXEsNeZVGD+OQ4xYUx2FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772699;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3BbzbXlXhudME51VfuDA2IEUZjYWy6JkSVXEoKM4BKQ=;
	b=Wox4NcW5tyJU/TbsN/FwSTXO0+wwe1CKY2Hw8/IMfntLTea8UUh0Ain+V8T+2luY4lU7
	 CpJ49btEL3PBjzPNGjBJlghzv68smsg5FzcN3R3oHTVbasKyFjfo6uVF5AF5xdn66SdZi
	 fzRnaMIOBrxpI3jm5hVlVFWvj7+jXwEV0CZTw5/Qtv6FK+Vy4+Shulk0WYcl2xL3tMUXX
	 fS/Ssm5FHMH4uHM0ozHEYnvPPWdqMCwHLozieFFocGT/ox2ks/OUgBqJlGvypLNPeeSQ5
	 v8R+w9UHUw7VlsYxublYhtBrZEiUudKXA8PITRancVQG5DJQVaXSJpuWirlfUzfh3SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6yRqSAC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A917A606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6yRqSAC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90B01F00897;
	Fri, 27 Nov 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772699;
	bh=3BbzbXlXhudME51VfuDA2IEUZjYWy6JkSVXEoKM4BKQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k6yRqSAC3iP0fc3jdX9Vx5Q8SZtz/0IqbYK/rk/b0ForTJt5qgbZqiRH+LLzwyCW4
	 adjEMkOHGPU9nphzOcW7uBuK0MYWP2zxYY/CPXccR1CBHBj5mi2oqRIIHNi+Ev5Lgt
	 rjcHay0qlhpj4qJowyi/PzM7B7RVE+m0+b8w84U7nS/3SfpiGJDGzEqqw6hBwkklbU
	 dDLD9rKap905rdEmkcqx+pHa3ykglEBwBMuluwc3AgM7N4lqNsghrPDTO7okvlA+L0
	 hF1csLNIus3Zt+8tIkemAM9rGI68vL25vnZN/v/4ZKwdIYxhyqnBpnqLVHmBDCwpTT
	 FxbePxKyFZPmg==
Subject: Re: [net PATCH 2/3] fbnic: Do not report a FW coredump info error as
 a parse failure
From: netdev-bot+sashiko@kernel.org
To: alexander.duyck@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org,
 pabeni@redhat.com
Date: Fri, 27 Nov 2026 09:44:58 +0000
Message-ID: <179577269832.3135.7443187068447815834@kernel.org>
In-Reply-To: <179555667294.7867.14016739586914876839.stgit@ahduyck-xeon-server.home.arpa>
References: <179555667294.7867.14016739586914876839.stgit@ahduyck-xeon-server.home.arpa>
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

- [Medium] The fix is incomplete.

--

fbnic: Do not report a FW coredump info error as a parse failure

This patch makes fbnic_fw_parse_coredump_info_resp() return 0 once the
completion has been filled in. A firmware-reported error, or -ENOENT when
no coredump is available, then no longer reaches the mailbox Rx path,
which would log it as an unprocessable message with a hex dump.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> index e00d626f64384..9a3df37674424 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> @@ -960,7 +960,7 @@ fbnic_fw_parse_coredump_info_resp(void *opaque, struct fbnic_tlv_msg **results)
>  	complete(&cmpl_data->done);
>  	fbnic_fw_put_cmpl(cmpl_data);
>  
> -	return err;
> +	return 0;
>  }

[Severity: Medium]

This fixes the coredump info handler. Is the same problem still present in
fbnic_fw_parse_coredump_resp()? That handler came in with the same Fixes:
commit and runs in the same devlink health dump flow,
fbnic_fw_reporter_dump():

fbnic_fw_parse_coredump_resp() {
    ...
	err = fta_get_sint(results, FBNIC_FW_COREDUMP_READ_ERROR);
	if (err)
		goto msg_err;
    ...
msg_err:
	cmpl_data->result = err;
	complete(&cmpl_data->done);
	fbnic_fw_put_cmpl(cmpl_data);

	return err;
}

fbnic_fw_parse_qsfp_read_resp() does the same thing with
FBNIC_FW_QSFP_ERROR. It stores the error in cmpl_data->result, completes
the request, and then returns err.

fbnic_tlv_msg_parse() returns the handler's value unchanged, and
fbnic_mbx_process_rx_msgs() then does this:

		err = fbnic_tlv_msg_parse(fbd, msg, fbnic_fw_tlv_parser);
		if (err) {
			dev_warn(fbd->dev, "Unable to process message: %d\n",
				 err);
			print_hex_dump(KERN_WARNING, "fbnic:",
				       DUMP_PREFIX_OFFSET, 16, 2,
				       msg, length, true);
		}

So when the firmware reports an error on a coredump read chunk or a QSFP
EEPROM read, the driver still logs the parse-failure warning and hex dump.
The callers already get the error through the completion. The later
patches in the series do not touch fbnic_fw.c, so both handlers are
unchanged at the end of the series.

Both handlers also have real malformed-message paths: -EINVAL for an
offset, length, bank or page mismatch, and -ENODATA for missing data. A
blanket return 0 would hide useful warnings in those cases.

Could these handlers follow the fbnic_fw_parse_tsene_read_resp() pattern
the commit message mentions? That handler keeps the firmware error in a
separate err_resp that only goes into the completion, and still returns
local validation errors:

	err_resp = fta_get_sint(results, FBNIC_FW_TSENE_ERROR);
	if (err_resp)
		goto msg_err;
    ...
msg_err:
	cmpl_data->result = err_resp ? : err;
	complete(&cmpl_data->done);
	fbnic_fw_put_cmpl(cmpl_data);

	return err;

>  
>  /**

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179555657536.7867.497419917946087787.stgit%40ahduyck-xeon-server.home.arpa
