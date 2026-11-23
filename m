Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429722;
	b=NW7FRPyLyElfgr30xRmukndVdEBUAhsmacwXulnxXbzNRahClNINAlSG967boPszCo0U
	 ZYTfIKzhD4qs9ZE8VLjMqviDtKQ8nTWxg0MNumOsnU5XUqj29uU1kM4GWOFdJf9Gu/0KK
	 qtyCEcQwRyvSXChv8Ri5cEufSbcxtOwwr4WwnIRn2JcXyoN1fklvJcVLXcUKPhznoXaHi
	 85Zht0rZ6b+ttZLhmX9W1X+hFqr0lE1QZZc41hZE4qDCtcxe52mPBs45AzXNgo+OU1UOf
	 P5XL8LLTqjTCAqzJ1/t6TqUhc7/gTAE7D09vAka2nqg1Ah6Nj+9WqAt/DL8+3g5zmoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429722;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3dEABjnP8zG4GS+2RR7xYcv4bokf7sqd6fxlHiM9nZA=;
	b=dHAC+O2tW3jsR2p/C+0e8sqLvtKuX5AKYCn9kConN/jnkhb6yQk3tIfL9LmLCcy8kXjJ
	 2UxQ6+Umbi53zgTVwA6I9JEzm+ldxk74VBSd6MIWxq+oCfsHLWOVKyGPd4F8+JAPNJBXu
	 RdGXoGOy8c+zDSSVp+ihSpb6cwfaf9Ka0SYsd0S4aElT9Er/aCY4I8ll5G7GdtQPA9rzJ
	 BhW9CZhDKnt1k5JUZPzKywIhDJtAslj2jPxtWUBStCBhC6aFltR9fpYKRusJ0lwmwEkEI
	 On7zO7QMGhU6Lp4zYAkC9nxKK0cVJrOzg9jk0F0D1QXRob7ea9x1O6GFVV8FsmsPmJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAdE3ts2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEBD606A31A;
	Mon, 23 Nov 2026 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAdE3ts2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7B11F000C6;
	Mon, 23 Nov 2026 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429721;
	bh=3dEABjnP8zG4GS+2RR7xYcv4bokf7sqd6fxlHiM9nZA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IAdE3ts28rbpjzsOoVlPyB/OB278tHv2AQSdyKejaw6hKNIDIOQGgQ32ezIjYBLXf
	 0bgwh/y2fZjTMnYVwTXz0AZwl289IDZnA3ItMV8J1ZCkjTee3PNocDmZN02Maa5u1f
	 +0THhfroqKhVYwyB65eA8zjDEkTMSYqCXI1CKcwZfKYqS3kH3QsLVmJyh+6oiAlTCj
	 J+G13AGJHY8incJaZNbtQTHWrL0ZZuOdz5v2hXjMUq1RAlGzQHqqcqPRGzYxTSyu8o
	 XdJ3GG/gcl++6K2gsX+ZDTTL2pOsHqyveE5p78JkLmTErYtKBMsc0vyR/PM/XbIO2s
	 8KeWdY180ACZw==
Subject: Re: [PATCH net] net/ncsi: fix channel loop termination when Channel
 Count is 0
From: netdev-bot+sashiko@kernel.org
To: me@7xz.dev
Cc: sam@mendozajonas.com, fercerpav@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 delphine_cc_chiu@wiwynn.com
Date: Mon, 23 Nov 2026 10:28:40 +0000
Message-ID: <179542972017.3135.10691735313982658423@kernel.org>
In-Reply-To: <20261119100625.72505-1-me@7xz.dev>
References: <20261119100625.72505-1-me@7xz.dev>
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

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says that "With the patch, Channel Count 0
  behaves exactly like Channel Count 1" and that the probe-path change…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch's
  own reasoning depends on it: the commit message says "Fixing the loop…

--

net/ncsi: fix channel loop termination when Channel Count is 0

This patch changes the termination checks of the channel walks in
ncsi_suspend_channel() and ncsi_probe_channel() from "==" to ">=". The
goal is that a controller reporting Channel Count 0 in its Get
Capabilities response can no longer make the walks run past the reported
count. The suspend_gls change fixes a hang seen after a link-down AEN.

> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 1d63958c4429b..c5cf2ca0385c1 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c

[ ... ]

> @@ -1491,7 +1491,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
>  			ndp->channel_probe_id++;
>  		}
>  
> -		if (ndp->channel_probe_id == ndp->channel_count) {
> +		if (ndp->channel_probe_id >= ndp->channel_count) {
>  			ndp->channel_probe_id = 0;
>  			nd->state = ncsi_dev_state_probe_dp;
>  		}

[Severity: High]
This is a pre-existing issue, not one introduced by this patch. The
commit message says:

  Fixing the loop bounds handles any reported value where it is used

Does that hold for large counts? ncsi_rsp_handler_gc() still stores the
8-bit Channel Count with no upper bound:

net/ncsi/ncsi-rsp.c:ncsi_rsp_handler_gc() {
    ...
	np->ndp->channel_count = rsp->channel_cnt;
    ...
}

A controller can report a count from 33 to 255. Both this probe loop and
the suspend_gls state in ncsi_suspend_channel() then send commands with
nca.channel = channel_probe_id, up to channel 254.

ncsi_cmd_build_header() does not mask the channel:

#define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) | (c))

So channel 31 becomes the reserved package-level channel. On package 0,
channel 32 goes out as 0x20, which is package 1, channel 0.

A channel that does not answer does not stop the walk.
ncsi_request_timeout()->ncsi_free_request() schedules the work again and
probing continues.

Suppose a second package, or an emulator that echoes the channel byte,
answers the CIS sent to 0x20. Package 1 has not been added yet, because
that only happens in ncsi_rsp_handler_sp(). So
ncsi_find_package_and_channel() returns np == NULL and nc == NULL:

net/ncsi/ncsi-rsp.c:ncsi_rsp_handler_cis() {
    ...
	ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel, &np, &nc);
	if (!nc) {
		if (ndp->flags & NCSI_DEV_PROBED)
			return -ENXIO;

		id = NCSI_CHANNEL_INDEX(rsp->rsp.common.channel);
		nc = ncsi_add_channel(np, id);
	}
    ...
}

NCSI_DEV_PROBED is still clear during probe. Can ncsi_add_channel() then
oops on spin_lock_irqsave(&np->lock, flags) in the NET_RX softirq?

The old "==" check produced the same aliasing for these counts. Would it
help to clamp channel_cnt in ncsi_rsp_handler_gc() to the range 1 to
NCSI_MAX_CHANNEL - 1, and to add an np NULL check in
ncsi_rsp_handler_cis()?

[Severity: Medium]
The commit message says:

  With the patch, Channel Count 0 behaves exactly like Channel Count 1
  (same command counts); Channel Count 1 is unchanged.

It also says the probe path change "removes the ordering dependency".
Is that true for ncsi_probe_channel()?

This check runs after every CIS/GVI/GC/GLS step. It compares against
ndp->channel_count, which is a single device-wide value.
ncsi_register_dev() sets it to NCSI_RESERVED_CHANNEL once. After that,
only ncsi_rsp_handler_gc() writes it, and it is never reset between
packages.

Take a single package that reports 0. If the GC response is processed
before the check that follows the GC command, as in the tests described
above, the check sees 0 >= 0. The state then moves to probe_dp and GLS is
never sent to channel 0.

If the response arrives later, GLS is sent. With a count of 1, GLS is
always sent. So with a count of 0, the result still depends on response
timing.

Now take multiple packages, where package N reports 0. The probe of
package N+1 sends CIS to channel 0 and hits the check right away:

  ncsi_dev_state_probe_cis:
    send CIS to channel 0
    nd->state = ncsi_dev_state_probe_gvi
    channel_probe_id (0) >= channel_count (0)
      nd->state = ncsi_dev_state_probe_dp

GVI, GC and GLS are never sent to package N+1 channel 0. Its caps,
version and link state stay at zero, and its other channels are not
probed. The zero caps could also make ncsi_check_hwa() treat the device
as not supporting HWA.

"==" behaves the same way in both of these cases, so this is no worse
than before. For a count of 0 to really behave like a count of 1, would
it need a clamp such as max(channel_cnt, 1), or a per-package bound?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119100625.72505-1-me%407xz.dev
