Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557659;
	b=26UzIXacUL+zEE7Y220L87RfjeaAyvHtjRokj72QmtwMV9xDfYKslxK3nRkioInoiWQ7
	 EiaibDDYO3wmj0AWC6FiMuQTi9y6VZ8kkcTIdGVtQjuq/AekRfBSrEyzLUHhzu1WTS+4l
	 f/thVibTJ0H3hbHBoWskjVilGt9+cck8eTOPyMml+PO+TjEUTqrlBH34YM9IdnEwSXdIB
	 JwVwmHKjtywXkHgonFqJGIDt7hjRt2GfhCTPGFJP3/8btLOhFpHOaK36Vr/Re1Bt3m4tR
	 YxvD8vdmeF2PzWYtDKJlMRClNmf8T4KTJNfywtJtq1GEOEovmEFv+Pdg2XPkVz9lQvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557659;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Svp5tfCVx3x2HzT5okbsmcjF/I6s13MdLGOG7N9xBME=;
	b=UZAAti3ymd0FnPllc25Pdwo0j8LJ93BuuCBY8x6zj0tH7Xiw5nrusPujY60d29iNQVki
	 1K3QFlXSFfiile2nSFaP20cMiRaNHpsLho1B3iTKiZwGW1FL6eyy9JwIJ1zFE+qEqqvXl
	 R45Pepz8m5o5pyWYf5ujQVHjBNoa0/j0KIhJBkoYcGE5wk4R+gPGw3WduDs3ciamYjy8S
	 cRFgdDFxHpF76xycZU/7cMX4s8kxW7+xBcN52LYciHrY+gruDuNHoQ/fWxDfebtHBI14k
	 mZkikDPlNSUFhm2cp0wRf6v//OgHtTYplbAoU/rEMpVVWx5CJza/PeQziHow/cyOA1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Pt/XGcBK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D5606A330
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pt/XGcBK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2B31F000C4;
	Tue, 24 Nov 2026 22:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557659;
	bh=Svp5tfCVx3x2HzT5okbsmcjF/I6s13MdLGOG7N9xBME=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Pt/XGcBKONzNFJeqO2MDoUVvQchlDbSgyMkgCiUQ2m+wd5Cdlef7AQW0CVpAlPrHR
	 54DQCNT2ClteL9M7CLuDJ3wisfo1Mj+MFk2nYUdGW2R+6RjMxP4TLaRaSR8DVlIfkw
	 /hK9KuYZdXU0WkuCvx8KzUPs6gqkfI6ffrwmBN0OE4HgibN70xCPH2i1hnEdm5uscF
	 b7lqc/RPtdCq8+oCmXdARKney6XWj+KS4q9RMJKg9UGOi0GPpZuhhkioaS3D0agP1M
	 aYD/ODOo2g+jA9tjiY1mSscCvg4BnfeRpXH2zCOb9NFz2VM2ItNs3XZWsuS1fsbWzZ
	 OWB3jTDAt1mJw==
Subject:
 Re: [PATCH net 2/4] ixgbe: fix incomplete ACI command buffer backup on retry
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 tomasz.lichwala@linux.intel.com, ripatel@wii.dev, xiaolinkui@kylinos.cn,
 xiaolinkui@126.com, runyu.xiao@seu.edu.cn, horms@kernel.org,
 marcin.szycik@linux.intel.com, przemyslaw.kitszel@intel.com,
 rafal.romanowski@intel.com
Date: Tue, 24 Nov 2026 22:00:57 +0000
Message-ID: <179555765776.3135.11697122330674580418@kernel.org>
In-Reply-To: <20261120220022.3133664-3-anthony.l.nguyen@intel.com>
References: <20261120220022.3133664-3-anthony.l.nguyen@intel.com>
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

- [Medium] The patch "ixgbe: fix incomplete ACI command buffer backup on
  retry" has the wrong Fixes: tag.

--

ixgbe: fix incomplete ACI command buffer backup on retry

This commit changes the EBUSY retry backup in ixgbe_aci_send_cmd(). It
now copies the whole indirect command buffer with kmemdup() instead of
saving only the first byte. It also skips the backup when buf_size is 0
and keys the restore off buf_cpy, to match ice_sq_send_cmd_retry().

> Fixes: c9e563cae19e ("ixgbe: add support for devlink reload")

[Severity: Medium]
Is this the right commit for the Fixes: tag?

In c9e563cae19e, the only change to ixgbe_e610.c is the new
ixgbe_aci_nvm_update_empr(). That function sends a direct command:

    return ixgbe_aci_send_cmd(hw, &desc, NULL, 0);

Its opcode, ixgbe_aci_opc_nvm_update_empr, is not listed in
ixgbe_should_retry_aci_send_cmd_execute(). With buf == NULL it also never
reaches the buf_cpy path.

The code this patch fixes in ixgbe_aci_send_cmd() looks like it came in
with the original ACI support. Running git blame on the baseline points the
backup:

    if (buf) {
        buf_cpy = kmalloc(buf_size, GFP_KERNEL);
        if (!buf_cpy)
            return -ENOMEM;
        *buf_cpy = *(u8 *)buf;
    }

and the restore:

    if (buf)
        memcpy(buf, buf_cpy, buf_size);

to 46761fd52a88 ("ixgbe: Add support for E610 FW Admin Command Interface").

Kernels that have 46761fd52a88 but not c9e563cae19e still have this bug.
Stable and CVE tooling would treat them as unaffected with the current tag.

Should the tag be the following instead?

    Fixes: 46761fd52a88 ("ixgbe: Add support for E610 FW Admin Command Interface")

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120220022.3133664-1-anthony.l.nguyen%40intel.com
