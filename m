Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581889;
	b=RySKVIBRt4pZSXLyEmqsgzguamLmOqhLxJJ833CHKMFx7hpZw5BaWLMav5G4gb2QO1iS
	 cgZMLB5entaWRd174jxI1SAgy2EjN76JeIuMZPhu2/pMtFE1vZNmSrCBP9skoPuBtsjsh
	 8gNA4z16k98EJyEs/KQBCdDOQSFnPqAwu66xezReikE7qb+yZx1cc0bxwleIK0c0nMx2M
	 ltjFMO3e/90BtHvnGGFrf96m4uzlIavM+jwrJEOOX/Zrg9ZaWx+2fIM2ncsvrZSGmo+TM
	 O44s0khT7VOMN4tNuW8kawJiZxeuugF6Y6mhQcwq4FQKpINw1Kq/I0z+z52FM1c4img==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581889;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=f4nKhL6BCHc76e1QSsjNaolj45jPoNKK6t/qBjGnops=;
	b=fpuv6NnedOiiSpo4jartLMqaIq5i/yBbwJprff7pvtZILoLsEjYPhWjpPbW8mg6M9HEF
	 mO+PbLK2ADb+XA3QtF+M7CoPGjWZ5HfdOrLtOgFckopkqKFMZY5PM9p/FEf3ZIpjjxflH
	 CcU02wIBp44tH0BX/iT0ufKXlRG4horrznIobv7uDPrTHZsL3Aklp7KSCDjhpWrlFLQrD
	 AS1xcnLgWUTND4RBV6ki3gYf+/kzvM0YJDNhS4hqqnyNilRIdL1ep1fVhaq9APG5/nsDi
	 rUAssQJrMgaQT7NPFcoygwgE3Qbjhxpt36hJyZ/q+xcpjr8X9Eu8jae4uMNN3GFhCvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZtjE7sk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71A606A326;
	Wed, 25 Nov 2026 04:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZtjE7sk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BA81F000C6;
	Wed, 25 Nov 2026 04:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795581889;
	bh=f4nKhL6BCHc76e1QSsjNaolj45jPoNKK6t/qBjGnops=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UZtjE7skXqqrd1RhY8r7ERvpYZnJvl8wCgZiqlFa2s4jWULNFdhDV/Mhip1p5i97/
	 +GlIclikTjRkjFgfV1+vsx4+UlxGSZnwCve4q2U9joVDl7VAh5JorI+9PhTUCb5lw3
	 X12RqQUl2Ki/yZdBYrRaoEq5cOPiiMjxFxXtJ/etS/AxfrhYa4rP/wGgdwkhBOKPon
	 KI3LHGQ0JopXVX2iR+qCM9dw+rBHJjBLT3k7QDHNv9Ukf0ZFNVwoToTdv/AKCCa2kU
	 83ygPs34OkdUPu1YbQUpWSBqIqZ2PeWD4zm8WbB2sA97Zsa+veXVvlNqKHsojlD9/o
	 YMGbIi2Sz4B6A==
Subject:
 Re: [PATCH net v5 8/8] ptp: ocp: correct the ART 10 MHz input frequency
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, arkadiusz.kubalewski@intel.com,
 arnd@arndb.de, davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us,
 john.stultz@linaro.org, jonathan.lemon@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev
Date: Wed, 25 Nov 2026 04:44:48 +0000
Message-ID: <179558188819.3135.13063151808595339248@kernel.org>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-8-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-8-ahmadexp@gmail.com>
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

- [Medium] The patch fixes only the 10 MHz case.

--

ptp: ocp: correct the ART 10 MHz input frequency

This commit changes the frequency of the ART input selector named 10Mhz
from 1000000 Hz to 10000000 Hz. That makes it match the 10 MHz value that
ART pins advertise and the matching ART output entry, so DPLL frequency
set requests for 10 MHz no longer fail with -EINVAL.

Link: https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org
Link: https://lore.kernel.org/r/179538007070.3135.8275620503580456948@kernel.org

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 821ecd1a13c8e..93923d5a29922 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -1385,7 +1385,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
>  
>  static const struct ocp_selector ptp_ocp_art_sma_in[] = {
>  	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
> -	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
> +	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 10000000 },
>  	{ }
>  };

[Severity: Medium]
The table change looks correct. Is the failure described in the commit
message still reachable on ART pins for two other advertised frequencies?

ptp_ocp_art_sma_init() registers every ART SMA pin with the shared
generic list:

drivers/ptp/ptp_ocp.c:ptp_ocp_art_sma_init() {
    ...
	.freq_supported_num = ARRAY_SIZE(ptp_ocp_sma_freq),
	.freq_supported = ptp_ocp_sma_freq,
    ...
}

That list also advertises IRIG-B (10000 Hz) and DCF77 (77500 Hz):

static struct dpll_pin_frequency ptp_ocp_sma_freq[] = {
	DPLL_PIN_FREQUENCY_1PPS,
	DPLL_PIN_FREQUENCY_10MHZ,
	DPLL_PIN_FREQUENCY_IRIG_B,
	DPLL_PIN_FREQUENCY_DCF77,
};

Neither ptp_ocp_art_sma_in[] nor ptp_ocp_art_sma_out[] has an entry for
10000 or 77500 Hz:

static const struct ocp_selector ptp_ocp_art_sma_out[] = {
	{ .name = "PHC",	.value = 0x0002,  .frequency = 1 },
	{ .name = "GNSS",	.value = 0x0004,  .frequency = 1 },
	{ .name = "10Mhz",	.value = 0x0010,  .frequency = 10000000 },
	{ }
};

dpll_pin_freq_set() in drivers/dpll/dpll_netlink.c validates a request
only against the advertised list through dpll_pin_is_freq_supported().
That means DPLL_CMD_PIN_SET with DPLL_A_PIN_FREQUENCY set to 10000 or
77500 on a non-fixed_fcn ART pin passes the core check.

The request then reaches ptp_ocp_dpll_frequency_set(), where it finds no
match and returns -EINVAL:

	tbl = bp->sma_op->tbl[sma->mode];
	for (i = 0; tbl[i].name; i++)
		if (tbl[i].frequency == frequency)
			return ptp_ocp_sma_store_val(bp, tbl[i].value,
						     sma->mode, sma_nr + 1);
	return -EINVAL;

Pin-get also keeps reporting IRIG-B and DCF77 for every ART pin, even
though the ART hardware has no selector for them.

Would it make sense to give ART pins their own freq_supported list that
contains only DPLL_PIN_FREQUENCY_1PPS and DPLL_PIN_FREQUENCY_10MHZ, either
in this patch or in a follow-up?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123-timecard-common-v5-d669cfa034-0-ahmadexp%40gmail.com
